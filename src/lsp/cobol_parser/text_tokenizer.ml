(**************************************************************************)
(*                                                                        *)
(*                        SuperBOL OSS Studio                             *)
(*                                                                        *)
(*  Copyright (c) 2022-2023 OCamlPro SAS                                  *)
(*                                                                        *)
(* All rights reserved.                                                   *)
(* This source code is licensed under the GNU Affero General Public       *)
(* License version 3 found in the LICENSE.md file in the root directory   *)
(* of this source tree.                                                   *)
(*                                                                        *)
(**************************************************************************)

module TEXT = Cobol_preproc.Text
module DIAGS = Cobol_common.Diagnostics

open Cobol_common.Srcloc.INFIX
open Cobol_common.Srcloc.TYPES
open Cobol_preproc.Text.TYPES
open Grammar_tokens                              (* import token constructors *)

(* --- *)

type token = Grammar_tokens.token with_loc
type tokens = token list

let combined_tokens =
  (* /!\ WARNING: None of the constituents of combined tokens may be
     context-sensitive.

     Rationale: this would considerably complicate retokenization (which is
     necessary with the current solution to handle context-sensitive
     keywords) *)
  Hashtbl.of_seq @@ List.to_seq [
    ON_EXCEPTION, "ON_EXCEPTION";
    NOT_ON_EXCEPTION, "NOT_ON_EXCEPTION";
    ON_OVERFLOW, "ON_OVERFLOW";
    NOT_ON_OVERFLOW, "NOT_ON_OVERFLOW";
    ON_SIZE_ERROR, "ON_SIZE_ERROR";
    NOT_ON_SIZE_ERROR, "NOT_ON_SIZE_ERROR";
    INVALID_KEY, "INVALID_KEY";
    NOT_INVALID_KEY, "NOT_INVALID_KEY";
    AT_END, "AT_END";
    NOT_AT_END, "NOT_AT_END";
    AT_EOP, "AT_EOP";
    NOT_AT_EOP, "NOT_AT_EOP";
    WITH_DATA, "WITH_DATA";
    NO_DATA, "NO_DATA";
    IS_GLOBAL, "IS_GLOBAL";
    IS_EXTERNAL, "IS_EXTERNAL";
    IS_TYPEDEF, "IS_TYPEDEF";
    DATA_RECORD, "DATA_RECORD";
    DATA_RECORDS, "DATA_RECORDS";
    NEXT_PAGE, "NEXT_PAGE";
  ]

let pp_token_string: Grammar_tokens.token Pretty.printer = fun ppf ->
  let string s = Pretty.string ppf s
  and print format = Pretty.print ppf format in
  function
  | WORD w
  | WORD_IN_AREA_A w
  | PICTURE_STRING w
  | INFO_WORD w
  | DIGITS w
  | SINTLIT w -> string w
  | EIGHTY_EIGHT -> string "88"
  | FIXEDLIT (i, sep, d) -> print "%s%c%s" i sep d
  | FLOATLIT (i, sep, d, e) -> print "%s%c%sE%s" i sep d e
  | ALPHANUM (s, q) -> print "%a%s%a" TEXT.pp_quote q s TEXT.pp_quote q
  | ALPHANUM_PREFIX (s, q) -> print "%a%s" TEXT.pp_quote q s
  | NATLIT s -> print "N\"%s\"" s
  | BOOLIT b -> print "B\"%a\"" Cobol_ptree.pp_boolean b
  | HEXLIT s -> print "X\"%s\"" s
  | NULLIT s -> print "Z\"%s\"" s
  | COMMENT_ENTRY e -> print "%a" Fmt.(list ~sep:sp string) e
  | INTERVENING_ c -> print "%c" c
  | t -> string @@
      try Text_lexer.show_token t
      with Not_found ->
      try Hashtbl.find combined_tokens t
      with Not_found -> "<unknown/unexpected token>"

let pp_token: token Pretty.printer = fun ppf ->
  let string s = Pretty.string ppf s
  and print format = Pretty.print ppf format in
  fun t -> match ~&t with
    | WORD w -> print "WORD[%s]" w
    | WORD_IN_AREA_A w -> print "WORD_IN_AREA_A[%s]" w
    | PICTURE_STRING w -> print "PICTURE_STRING[%s]" w
    | INFO_WORD s -> print "INFO_WORD[%s]" s
    | COMMENT_ENTRY _ -> print "COMMENT_ENTRY[%a]" pp_token_string ~&t
    | DIGITS i -> print "DIGITS[%s]" i
    | SINTLIT i -> print "SINT[%s]" i
    | FIXEDLIT (i, sep, d) -> print "FIXED[%s%c%s]" i sep d
    | FLOATLIT (i, sep, d, e) -> print "FLOAT[%s%c%sE%s]" i sep d e
    | INTERVENING_ c -> print "<%c>" c
    | EOF -> string "EOF"
    | t -> pp_token_string ppf t

let pp_tokens = Pretty.list ~fopen:"@[" ~fclose:"@]" pp_token

(* --- *)

let loc_in_area_a: srcloc -> bool = Cobol_common.Srcloc.in_area_a
let token_in_area_a: token -> bool = fun t -> loc_in_area_a ~@t

(* --- *)

(* Tokenization of manipulated text, to feed the compilation group parser: *)

let preproc_n_combine_tokens ~source_format =
  (* Simplifies the grammar, and applies some token-based pre-processsing to
     deal with old-style informational paragraphs (COBOL85). *)
  let ( +@+ ) = Cobol_common.Srcloc.concat
  and start_pos = Cobol_common.Srcloc.start_pos in
  let comment_entry_termination =
    let Cobol_preproc.Src_format.SF sf = source_format in
    Cobol_preproc.Src_format.comment_entry_termination sf
  and info_word = function
    | WORD w ->
        INFO_WORD w
    | t ->
        (* Try de-tokenizing to accept, e.g, PROGRAM-ID. nested. (as NESTED is a
           keyword). *)
        try INFO_WORD (Hashtbl.find Text_lexer.keyword_of_token t)
        with Not_found -> t
  and comment_entry revtoks =
    COMMENT_ENTRY (List.rev_map (Pretty.to_string "%a" pp_token_string) revtoks)
  in
  let open List in
  let rec skip ((p', l', dgs) as acc) ((p, l) as pl) = function
    | 0 -> acc, pl
    | i -> skip (hd p :: p', hd l :: l', dgs) (tl p, tl l) (i - 1)
  and aux acc (p, l) =
    let subst_n x y =
      let rec cons x ((p', l', dgs) as _acc) (p, l) = function
        | 0 -> assert false
        | 1 -> aux (x :: p', hd l :: l', dgs) (tl p, tl l)
        | i -> cons x acc (tl p, hd l +@+ hd (tl l) :: tl (tl l)) (i - 1)
      in
      cons x acc (p, l) y
    and info_word_after n =
      let (p', l', dgs), (p, l) = skip acc (p, l) n in
      match p with
      | [] -> Result.Error `MissingInputs
      | t :: _ -> aux (info_word t :: p', hd l :: l', dgs) (tl p, tl l)
    and lex_err msg =
      Pretty.delayed_to begin fun dmsg ->
        let (p', l', diags), pl = skip acc (p, l) 1 in
        aux (p', l', DIAGS.Acc.error diags ~loc:(hd l) "%t" dmsg) pl
      end msg
    and comment_entry_after n =
      let acc, ((p, _) as suff) = skip acc (p, l) n in
      if p = [] then Result.Error `MissingInputs else
        let consume_comment = match comment_entry_termination with
          | Newline ->
              comment_line ~init_pos:(Cobol_common.Srcloc.start_pos @@ hd l)
          | Period ->
              comment_paragraph ?stop_column:None
          | AreaB { first_area_b_column } ->
              comment_paragraph ~stop_column:first_area_b_column
        and at_end ~loc ~revtoks (p', l', diags) =
          let p', l' = comment_entry revtoks :: p', loc :: l' in
          p', l', diags
        in
        consume_comment ~loc:(hd l) ~revtoks:[] ~at_end
          ("comment@ entry": Pretty.simple) acc suff
    in
    match p with

    | [ON] | [NOT] | [NOT; ON]       -> Error `MissingInputs
    | ON :: EXCEPTION :: _             -> subst_n     ON_EXCEPTION 2
    | NOT :: EXCEPTION :: _            -> subst_n NOT_ON_EXCEPTION 2
    | NOT :: ON :: EXCEPTION :: _       -> subst_n NOT_ON_EXCEPTION 3

    | ON :: OVERFLOW :: _              -> subst_n     ON_OVERFLOW 2
    | NOT :: OVERFLOW :: _             -> subst_n NOT_ON_OVERFLOW 2
    | NOT :: ON :: OVERFLOW :: _        -> subst_n NOT_ON_OVERFLOW 3

    | [ON; SIZE] | [SIZE]
    | [NOT; ON; SIZE] | [NOT; SIZE]  -> Error `MissingInputs
    | ON :: SIZE :: ERROR :: _          -> subst_n     ON_SIZE_ERROR 3
    | SIZE :: ERROR :: _               -> subst_n     ON_SIZE_ERROR 2
    | NOT :: ON :: SIZE :: ERROR :: _    -> subst_n NOT_ON_SIZE_ERROR 4
    | NOT :: SIZE :: ERROR :: _         -> subst_n NOT_ON_SIZE_ERROR 3

    | [INVALID] | [NOT; INVALID]     -> Error `MissingInputs
    | INVALID :: KEY :: _              -> subst_n     INVALID_KEY 2
    | INVALID :: _                    -> subst_n     INVALID_KEY 1
    | NOT :: INVALID :: KEY :: _        -> subst_n NOT_INVALID_KEY 3
    | NOT :: INVALID :: _              -> subst_n NOT_INVALID_KEY 2

    | [AT] | [NOT; AT]               -> Error `MissingInputs
    | AT :: END :: _                   -> subst_n     AT_END 2
    | NOT :: AT :: END :: _             -> subst_n NOT_AT_END 3
    | NOT :: END :: _                  -> subst_n NOT_AT_END 2

    | AT ::(END_OF_PAGE|EOP):: _       -> subst_n     AT_EOP 2
    | NOT :: AT ::(END_OF_PAGE|EOP):: _ -> subst_n NOT_AT_EOP 3
    | NOT ::(END_OF_PAGE|EOP):: _      -> subst_n NOT_AT_EOP 2

    | [WITH] | [NO]                  -> Error `MissingInputs
    | WITH :: DATA :: _                -> subst_n WITH_DATA 2
    | NO :: DATA :: _                  -> subst_n NO_DATA 2

    | [IS]                           -> Error `MissingInputs
    | IS :: GLOBAL :: _                -> subst_n IS_GLOBAL 2
    | IS :: EXTERNAL :: _              -> subst_n IS_EXTERNAL 2
    | IS :: TYPEDEF :: _               -> subst_n IS_TYPEDEF 2

    | [DATA]                         -> Error `MissingInputs
    | DATA :: RECORD :: _              -> subst_n DATA_RECORD 2
    | DATA :: RECORDS :: _             -> subst_n DATA_RECORDS 2

    | [NEXT]                         -> Error `MissingInputs
    | NEXT :: PAGE :: _                -> subst_n NEXT_PAGE 2

    | [CONSTANT]                     -> Error `MissingInputs
    | CONSTANT :: RECORD :: _          -> subst_n CONSTANT_RECORD 2

    | [PROGRAM_ID]                   -> Error `MissingInputs
    | PROGRAM_ID :: PERIOD :: _        -> info_word_after 2

    | [AUTHOR | INSTALLATION |
       DATE_WRITTEN | DATE_MODIFIED |
       DATE_COMPILED | REMARKS |
       SECURITY]                     -> Error `MissingInputs
    | (AUTHOR | INSTALLATION |
       DATE_WRITTEN | DATE_MODIFIED |
       DATE_COMPILED | REMARKS |
       SECURITY) :: PERIOD :: _        -> comment_entry_after 2

    | ALPHANUM_PREFIX (s, _) :: _     -> lex_err "Missing continuation of `%s'" s

    | tok :: _                        -> subst_n tok 1

    | []                             -> Ok acc

  and comment_paragraph ?stop_column ~loc ~revtoks ~at_end descr acc = function
    | [], _ ->                (* no word starting in Area A, or not period yet *)
        Result.Error `MissingInputs
    | EOF :: _ as p, l ->                        (* ignore all tokens until EOF *)
        let _, _, diags = at_end ~loc ~revtoks acc in
        Error (`ReachedEOF (loc, descr, diags, p, l))
    | PERIOD as period :: p, period_loc :: l
      when Option.is_none stop_column ->
        let revtoks = period :: revtoks and loc = loc +@+ period_loc in
        aux (at_end ~loc ~revtoks acc) (p, l)
    | p, (p_loc :: _ as l)
      when (let Lexing.{ pos_bol; pos_cnum; _ } = start_pos p_loc in
            Option.fold stop_column                (* stop_column starts at 1 *)
              ~some:(fun col -> pos_cnum - pos_bol + 1 < col) ~none:false) ->
        aux (at_end ~loc ~revtoks acc) (p, l)
    | t :: tlp, l ->
        comment_paragraph ?stop_column ~at_end descr acc (tlp, tl l)
          ~loc:(loc +@+ hd l) ~revtoks:(t :: revtoks)

  and comment_line ~init_pos ~loc ~revtoks ~at_end descr acc = function
    | [], _ ->                  (* found no word starting on anther line (yet) *)
        Result.Error `MissingInputs
    | p, (p_loc :: _ as l)
      when (let Lexing.{ pos_fname; pos_bol; _ } = start_pos p_loc in
            pos_bol > init_pos.Lexing.pos_bol ||
            pos_fname <> init_pos.pos_fname) ->
        aux (at_end ~loc ~revtoks acc) (p, l)
    | t :: tlp, l ->
        comment_line ~init_pos ~at_end descr acc (tlp, tl l)
          ~loc:(loc +@+ hd l) ~revtoks:(t :: revtoks)

  in
  fun tokens ->
    let p, srclocs = split @@ map (~&@) tokens in
    match aux ([], [], DIAGS.Set.none) (p, srclocs) with
    | Ok (p, l, dgs) ->
        Ok (rev_map2 (&@) p l, dgs)
    | Error (`ReachedEOF (loc, descr, dgs, p, l)) ->
        Error (`ReachedEOF (loc, descr, dgs, rev_map2 (&@) p l))
    | Error `MissingInputs ->
        Error `MissingInputs

(* --- *)

type 'a memory =
  | Amnesic: Cobol_common.Behaviors.amnesic memory
  | Eidetic: tokens -> Cobol_common.Behaviors.eidetic memory

type 'm state =
  {
    expect_picture_string: bool;
    leftover_tokens: tokens; (* non-empty only when [preproc_n_combine_tokens]
                                errors out for lack of input tokens. *)
    memory: 'm memory;
    context_stack: Context.stack;
    diags: DIAGS.Set.t;
    persist: persist;
  }

(** Part of the state that (almost) never changes. *)
and persist =
  {
    lexer: Text_lexer.lexer;
    context_tokens: Grammar_contexts.context_tokens;
    verbose: bool;
    show_if_verbose: [`Tks | `Ctx] list;
  }

let amnesic = Amnesic
let eidetic = Eidetic []
let init
    ?(verbose = false)
    ?(show_if_verbose = [`Tks; `Ctx])
    ~memory
    words
  =
  let lexer = Text_lexer.create () in
  let Grammar_contexts.{ context_tokens;
                         context_sensitive_tokens;
                         context_sensitive_tokens_unimplemented = _ } =
    Grammar_contexts.init
      ~handle_of_token:(Text_lexer.handle_of_token lexer)
  in
  Text_lexer.disable_tokens context_sensitive_tokens;
  Text_lexer.reserve_words lexer words;
  {
    expect_picture_string = false;
    leftover_tokens = [];
    memory;
    context_stack = Context.empty_stack;
    diags = DIAGS.Set.none;
    persist =
      {
        lexer;
        context_tokens;
        verbose;
        show_if_verbose =
          (if List.mem `Tks show_if_verbose then [`Tks] else []) @
          (if List.mem `Ctx show_if_verbose then [`Ctx] else []);
      }
  }

let diagnostics { diags; _ } = diags
let parsed_tokens { memory = Eidetic tokens; _ } = lazy (List.rev tokens)

let show tag { persist = { verbose; show_if_verbose; _ }; _ } =
  verbose && List.mem tag show_if_verbose

(* --- *)

let distinguish_words: (Grammar_tokens.token with_loc as 't) -> 't = function
  | { payload = WORD w; loc } when loc_in_area_a loc ->
      WORD_IN_AREA_A w &@ loc
  | t -> t

let tokens_of_word { persist = { lexer; _ }; _ }
  : text_word with_loc -> tokens * DIAGS.Set.t =
  fun { payload = c; loc } ->
  let tok t = [t &@ loc], DIAGS.Set.none in
  match c with
  | TextWord w
  | CDirWord w
    -> let tokens = Text_lexer.tokens_of_string' lexer (w &@ loc) in
      List.map distinguish_words tokens, DIAGS.Set.none
  (* | Alphanum { knd = Basic; str; qte = quotation; _ } *)
  (*   (\* TODO: Leave those as is in the parse-tree, and decode later *\) *)
  (*   when Config.ebcdic_symbolic_characters#value *)
  (*   -> let token, diags = *)
  (*        Text_lexer.decode_symbolic_ebcdics' ~quotation (str &@ loc) in *)
  (*     [token], diags *)
  | Alphanum { knd = Basic; str; qte; _ }
    -> tok @@ ALPHANUM (str, qte)
  | Alphanum { knd = Bool; str; _ }
    -> tok @@ BOOLIT (Cobol_ptree.boolean_of_string ~base:`Bool str)
  | Alphanum { knd = BoolX; str; _ }
    -> tok @@ BOOLIT (Cobol_ptree.boolean_of_string ~base:`Hex str)
  | Alphanum { knd = Hex; str; _ }
    -> tok @@ HEXLIT str                 (* TODO: decide on a representation *)
  | Alphanum { knd = NullTerm; str; _ }
    -> tok @@ NULLIT str
  | Alphanum { knd = National | NationalX; str; _ }  (* TODO: differentiate *)
    -> tok @@ NATLIT str
  | AlphanumPrefix { str; qte; _ }
    -> tok @@ ALPHANUM_PREFIX (str, qte)
  | Eof
    -> tok EOF
  | Pseudo _
    -> [], DIAGS.(Acc.error Set.none) ~loc "Unexpected@ pseudotext"

let tokens_of_text: 'a state -> text -> tokens * 'a state = fun state ->
  (* After text manipulation. We need special handling of `PICTURE [IS]` to
     bypass usual tokenization of picture strings. *)
  let prod (acc, ({ expect_picture_string; _ } as s)) = function
    | { payload = PICTURE; _ } as p ->
        p :: acc, { s with expect_picture_string = true }
    | { payload = IS; _ } as p
      when expect_picture_string ->
        p :: acc, { s with expect_picture_string = true }
    | p ->
        p :: acc, { s with expect_picture_string = false }
  in
  let tokenize_text_word: string with_loc -> _ =
    let tokenizer ~loc lb =
      Text_lexer.tokens state.persist.lexer (lb &@ Lazy.force loc)
    and prod_tokens t acc =
      List.fold_left (fun acc t -> prod acc @@ distinguish_words t) acc ~&t
    in
    fun w ->
      Cobol_common.Tokenizing.fold_tokens ~tokenizer ~f:prod_tokens w
        ~until:(function [{ payload = EOF; _ }] -> true | _ -> false)
  and prod_word (acc, ({ diags; _ } as state)) word =
    let t, diags' = tokens_of_word state word in
    let state = { state with diags = DIAGS.Set.union diags diags' } in
    List.fold_left prod (acc, state) t
  in
  let rec acc_text ((_, ({ expect_picture_string; _ })) as acc) word =
    if expect_picture_string
    then match ~&word with
      | TextWord "IS" -> prod acc (IS &@<- word)
      | TextWord w -> prod acc (PICTURE_STRING w &@<- word)
      | _ -> missing_picstr acc word
    else match ~&word with
      | TextWord w -> tokenize_text_word (w &@<- word) acc
      | _ -> prod_word acc word
  and missing_picstr (acc, ({ diags; _ } as state)) ({ loc; _ } as word) =
    let state =
      { state with
        diags = DIAGS.Acc.error diags ~loc "Missing@ PICTURE@ string@ (got@ \
                                            `%a'@ instead)" TEXT.pp_word word;
        expect_picture_string = false }
    in
    acc_text (acc, state) word
  in
  fun text ->
    let acc, state = List.fold_left acc_text ([], state) text in
    List.rev acc, state

let tokenize_text ~source_format ({ leftover_tokens; _ } as state) text =
  let state = { state with leftover_tokens = [] } in
  let new_tokens, state = tokens_of_text state text in
  let tokens = leftover_tokens @ new_tokens in
  match preproc_n_combine_tokens ~source_format tokens with
  | Ok (tokens, diags) ->
      if show `Tks state then
        Pretty.error "Tks: %a@." pp_tokens tokens;
      Ok tokens, { state with diags = DIAGS.Set.union diags state.diags }
  | Error `MissingInputs ->
      Error `MissingInputs, { state with leftover_tokens = tokens }
  | Error (`ReachedEOF (loc, extected_item, diags, tokens)) ->
      Error (`ReachedEOF tokens),
      let diags = DIAGS.Set.union diags state.diags in
      { state with
        diags = DIAGS.Acc.error diags ~loc "Unterminated %(%)" extected_item }

let emit_token (type m) (s: m state) tok : m state =
  match s.memory with
  | Amnesic -> s
  | Eidetic toks -> { s with memory = Eidetic (tok :: toks) }

let put_token_back (type m) (s: m state) : m state =
  match s.memory with
  | Amnesic -> s
  | Eidetic [] -> Fmt.invalid_arg "put_token_back: unexpected memory state"
  | Eidetic (_ :: toks) -> { s with memory = Eidetic toks }

let next_token (s: _ state) =
  let rec aux = function
    | { payload = INTERVENING_ ','; _ } :: tokens ->
        aux tokens
    | { payload = INTERVENING_ '.'; loc } :: tokens ->
        Some (s, PERIOD &@ loc, tokens)
    | token :: tokens ->
        Some (emit_token s token, token, tokens)
    | [] ->
        None
  in
  aux

type lexer_update =
  | Enabled of Text_lexer.TokenHandles.t
  | Disabled of Text_lexer.TokenHandles.t
  | CommaBecomesDecimalPoint

let token_of_string { persist = { lexer; _ }; _ } =
  Text_lexer.token_of_string' lexer

let tokens_of_string' { persist = { lexer; _ }; _ } =
  Text_lexer.tokens_of_string' lexer

(** Retokenizes the tokens {e after} the given operation has been perfomed on
    {!module:Text_lexer}. *)
(* TODO: Find whether everything related to Area A and comma-retokenization
   could be moved to Text_lexer *)
let retokenize_after: lexer_update -> _ state -> tokens -> tokens = fun update s ->
  match update with
  | Enabled tokens | Disabled tokens
    when Text_lexer.TokenHandles.is_empty tokens ->
      Fun.id
  | Enabled _ ->
      List.map begin fun token -> match ~&token with
        | WORD_IN_AREA_A w
        | WORD w -> distinguish_words @@ token_of_string s (w &@<- token)
        | _ -> token
      end
  | Disabled tokens ->
      let keyword_of_token = Hashtbl.find Text_lexer.keyword_of_token in
      List.map begin fun token ->
        if Text_lexer.TokenHandles.mem_text_token ~&token tokens
        then match token_in_area_a token, keyword_of_token ~&token with
          | true, w -> WORD_IN_AREA_A w &@<- token
          | false, w -> WORD w &@<- token
        else token
      end
  | CommaBecomesDecimalPoint ->
      (* This may only happen when the comma becomes a decimal separator in
         numerical literals, instead of periods.  Before this (irreversible)
         change, any intervening comma is represented with a special
         [INTERVENING_ ','] token in the list of tokens procuded by
         {!tokenize_text}. *)
      (* Find any INTERVENING_COMMA and retokenize with the two adjacent words
         if they are SINTLIT on the left, and DIGITS (or FLOATLIT) on the
         right (possible combinations are generated in {!Text_lexer.token}).
         To deal with periods, we need to retokenize any FIXEDLIT and
         FLOATLIT. *)
      let show_fixed (i, c, d) = Pretty.to_string "%s%c%s" i c d in
      let show_float (i, c, d, e) = Pretty.to_string "%s%c%sE%s" i c d e in
      let rec aux rev_prefix suffix =
        match rev_prefix, suffix with
        | { payload = SINTLIT l; loc = lloc } :: rev_prefix,
          { payload = INTERVENING_ ','; loc = cloc } ::
          { payload = DIGITS r; loc = rloc } :: suffix ->
            retokenize_with_comma rev_prefix suffix
              l lloc cloc r rloc
        | { payload = SINTLIT l; loc = lloc } :: rev_prefix,
          { payload = INTERVENING_ ','; loc = cloc } ::
          { payload = FLOATLIT f; loc = rloc } :: suffix ->
            retokenize_with_comma rev_prefix suffix
              l lloc cloc (show_float f) rloc
        | _, { payload = FIXEDLIT f; loc } :: suffix ->
            let toks = tokens_of_string' s (show_fixed f &@ loc) in
            aux (List.rev_append toks rev_prefix) suffix
        | _, { payload = FLOATLIT f; loc } :: suffix ->
            let toks = tokens_of_string' s (show_float f &@ loc) in
            aux (List.rev_append toks rev_prefix) suffix
        | _, [] ->
            List.rev rev_prefix
        | _, x :: tl ->
            aux (x :: rev_prefix) tl
      and retokenize_with_comma rev_prefix suffix l l_loc sep_loc r r_loc =
        let loc = Cobol_common.Srcloc.(concat (concat l_loc sep_loc) r_loc) in
        let tks = tokens_of_string' s (Pretty.to_string "%s,%s" l r &@ loc) in
        aux (List.rev_append tks rev_prefix) suffix
      in
      aux []

(** Enable incoming tokens w.r.t the lexer, and retokenize awaiting tokens
    (i.e. that may have been tokenized according to out-of-date rules) *)
let enable_tokens state tokens incoming_tokens =
  Text_lexer.enable_tokens incoming_tokens;
  state, retokenize_after (Enabled incoming_tokens) state tokens

(** Disable incoming tokens w.r.t the lexer, and retokenize awaiting tokens
    (i.e. that may have been tokenized according to out-of-date rules) *)
let disable_tokens state tokens outgoing_tokens =
  Text_lexer.disable_tokens outgoing_tokens;
  state, retokenize_after (Disabled outgoing_tokens) state tokens

let decimal_point_is_comma (type m) (state: m state) token tokens =
  let state = put_token_back state in
  let state =
    let lexer = Text_lexer.decimal_point_is_comma state.persist.lexer in
    { state with persist = { state.persist with lexer } }
  in
  let tokens = token :: tokens in
  let tokens = retokenize_after CommaBecomesDecimalPoint state tokens in
  let token, tokens = List.hd tokens, List.tl tokens in
  if show `Tks state then
    Pretty.error "Tks': %a@." pp_tokens tokens;
  emit_token state token, token, tokens

let put_token_back state token tokens =
  put_token_back state, token :: tokens

(* --- *)

let with_context_stack state context_stack =
  if context_stack == state.context_stack then state
  else { state with context_stack }

let push_contexts state tokens : Context.t list -> 's * 'a = function
  | [] ->
      state, tokens
  | contexts ->
      let context_stack, tokens_set =
        let context_tokens = state.persist.context_tokens in
        List.fold_left begin fun (stack, set) ctx ->
          if show `Ctx state then
            Pretty.error "Incoming: %a@."
              (Context.pp_context context_tokens) ctx;

          (* Push the new context on top of the stack *)
          let stack = Context.push context_tokens ctx stack in

          stack, Text_lexer.TokenHandles.union set @@ Context.top_tokens stack
        end (state.context_stack, Text_lexer.TokenHandles.empty) contexts
      in

      (* Update tokenizer state *)
      let state, tokens = enable_tokens state tokens tokens_set in
      if show `Tks state then
        Pretty.error "Tks': %a@." pp_tokens tokens;

      with_context_stack state context_stack, tokens

let top_context state =
  Context.top state.context_stack

let pop_context ({ context_stack; _ } as state) tokens =
  let context_stack, tokens_set = Context.pop context_stack in

  if show `Ctx state then
    Pretty.error "Outgoing: %a@." Text_lexer.pp_tokens_via_handles tokens_set;

  let state, tokens = disable_tokens state tokens tokens_set in
  { state with context_stack }, tokens

let enable_context_sensitive_tokens state =
  Text_lexer.enable_tokens (Context.all_tokens state.context_stack)

let disable_context_sensitive_tokens state =
  Text_lexer.disable_tokens (Context.all_tokens state.context_stack)
