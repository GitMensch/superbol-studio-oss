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

open Cobol_common.Srcloc.TYPES
open Cobol_common.Srcloc.INFIX
open Cobol_common.Visitor
open Cobol_common.Visitor.INFIX                         (* for `>>` (== `|>`) *)
open Terms_visitor

let todo    x = Cobol_common.Visitor.todo    __FILE__ x
let partial x = Cobol_common.Visitor.partial __FILE__ x

(* --- *)

module Make
    (Misc_sections: Abstract.MISC_SECTIONS)
    (Data_division: Abstract.DATA_DIVISION)
    (Proc_division: Abstract.PROC_DIVISION) =
struct

  module Compilation_group =
    Raw.Compilation_group (Misc_sections) (Data_division) (Proc_division)

  module Compilation_group_visitor =
    Abstract_visitor.For_compilation_group (Compilation_group)
  module Misc_sections_visitor =
    Abstract_visitor.For_misc_sections (Misc_sections)
  module Data_division_visitor =
    Abstract_visitor.For_data_division (Data_division)
  module Proc_division_visitor =
    Abstract_visitor.For_proc_division (Proc_division)

  open Compilation_group

  class virtual ['a] folder = object
    inherit ['a] Terms_visitor.folder
    inherit ['a] Misc_sections_visitor.folder
    inherit ['a] Data_division_visitor.folder
    method fold_data_division'           : (data_division with_loc       , 'a) fold = default
    inherit ['a] Proc_division_visitor.folder
    method fold_procedure_division'      : (procedure_division with_loc  , 'a) fold = default
    inherit ['a] Compilation_group_visitor.folder
    method fold_program_unit             : (program_unit                 , 'a) fold = default
    method fold_program_unit'            : (program_unit with_loc        , 'a) fold = default
    method fold_function_unit            : (function_unit                , 'a) fold = default
    method fold_function_unit'           : (function_unit with_loc       , 'a) fold = default
    method fold_method_definition        : (method_definition            , 'a) fold = default
    method fold_factory_definition       : (factory_definition           , 'a) fold = default
    method fold_instance_definition      : (instance_definition          , 'a) fold = default
    method fold_class_definition'        : (class_definition with_loc    , 'a) fold = default
    method fold_interface_definition'    : (interface_definition with_loc, 'a) fold = default
    method fold_compilation_unit'        : (compilation_unit with_loc    , 'a) fold = default
    (* Additonal methods: *)
    method fold_method_kind              : (method_kind                  , 'a) fold = default
  end

  let todo    x = todo    __MODULE__ x
  let partial x = partial __MODULE__ x

  let fold_options_paragraph_opt (v: _ #folder) =
    fold_option ~fold:(fun v -> v#continue_with_options_paragraph) v

  let fold_environment_division' (v: _ #folder) =
    fold' ~fold:(fun v -> v#continue_with_environment_division) v

  let fold_environment_division'_opt (v: _ #folder) =
    fold_option ~fold:fold_environment_division' v

  let fold_data_division' (v: _ #folder) =
    handle' v#fold_data_division' v ~fold:(fun v -> v#continue_with_data_division)

  let fold_data_division'_opt (v: _ #folder) =
    fold_option ~fold:fold_data_division' v

  let fold_procedure_division' (v: _ #folder) =
    handle' v#fold_procedure_division' v
      ~fold:(fun v -> v#continue_with_procedure_division)

  let fold_procedure_division_opt (v: _ #folder) =
    fold_option ~fold:(fun v -> v#continue_with_procedure_division) v

  let fold_procedure_division'_opt (v: _ #folder) =
    fold_option ~fold:fold_procedure_division' v

  let rec fold_program_unit (v: _ #folder) =
    handle v#fold_program_unit
      ~continue:begin fun { program_name; program_as; program_level;
                            program_options; program_env; program_data;
                            program_proc; program_end_name } x -> x
        >> fold_name' v program_name
        >> fold_strlit_opt v program_as
        >> fold_options_paragraph_opt v program_options
        >> fold_environment_division'_opt v program_env
        >> fold_data_division'_opt v program_data
        >> (fun x -> match program_level with
            | ProgramPrototype -> x
            | ProgramDefinition { kind;
                                  has_identification_division;
                                  informational_paragraphs = infos;
                                  nested_programs } -> ignore kind; x
                >> fold_bool v has_identification_division
                >> v#continue_with_informational_paragraphs infos
                >> fold_with_loc_list v nested_programs ~fold:fold_program_unit)
        >> fold_procedure_division'_opt v program_proc
        >> fold_name'_opt v program_end_name                  (* XXX: useful? *)
      end

  let fold_program_unit' (v: _#folder) =
    handle' v#fold_program_unit' ~fold:fold_program_unit v

  let fold_function_unit (v: _#folder) =
    handle v#fold_function_unit
      ~continue:begin fun { function_name; function_as; function_is_proto;
                            function_options; function_env; function_data;
                            function_proc; function_end_name } x -> x
        >> fold_name' v function_name
        >> fold_strlit_opt v function_as
        >> fold_bool v function_is_proto                      (* XXX: useful? *)
        >> fold_options_paragraph_opt v function_options
        >> fold_environment_division'_opt v function_env
        >> fold_data_division'_opt v function_data
        >> fold_procedure_division_opt v function_proc
        >> fold_name' v function_end_name                     (* XXX: useful? *)
      end

  let fold_function_unit' (v: _#folder) =
    handle' v#fold_function_unit' ~fold:fold_function_unit v

  let fold_method_kind (v: _#folder) =
    handle v#fold_method_kind
      ~continue:begin function
        | NamedMethod { as_ } -> fold_strlit_opt v as_
        | PropertyMethod { kind } -> fold_property_kind v kind
      end

  let fold_method_definition (v: _#folder) =
    handle v#fold_method_definition
      ~continue:begin fun { method_name; method_kind;
                            method_override; method_final;
                            method_options; method_env; method_data;
                            method_proc; method_end_name } x -> x
        >> fold_name' v method_name
        >> fold_method_kind v method_kind
        >> fold_bool v method_override
        >> fold_bool v method_final
        >> fold_options_paragraph_opt v method_options
        >> fold_environment_division'_opt v method_env
        >> fold_data_division'_opt v method_data
        >> fold_procedure_division_opt v method_proc
        >> fold_name' v method_end_name                       (* XXX: useful? *)
      end

  let fold_factory_definition (v: _#folder) =
    handle v#fold_factory_definition
      ~continue:begin fun { factory_implements; factory_options; factory_env;
                            factory_data; factory_methods } x -> x
        >> fold_name'_list v factory_implements
        >> fold_options_paragraph_opt v factory_options
        >> fold_environment_division'_opt v factory_env
        >> fold_data_division'_opt v factory_data
        >> fold_option v factory_methods
          ~fold:(fold_with_loc_list ~fold:fold_method_definition)
      end

  let fold_instance_definition (v: _#folder) =
    handle v#fold_instance_definition
      ~continue:begin fun { instance_implements; instance_options; instance_env;
                            instance_data; instance_methods } x ->
        ignore instance_env;
        partial __LINE__ "fold_instance_definition" ();
        x
        >> fold_name'_list v instance_implements
        >> fold_options_paragraph_opt v instance_options
        >> fold_data_division'_opt v instance_data
        >> fold_option v instance_methods
          ~fold:(fold_with_loc_list ~fold:fold_method_definition)
      end

  let fold_class_definition' (v: _#folder) =
    handle v#fold_class_definition'
      ~continue:(todo __LINE__ "fold_class_definition")

  let fold_interface_definition' (v: _#folder) =
    handle v#fold_interface_definition'
      ~continue:(todo __LINE__ "fold_interface_definition")

  let fold_compilation_unit' (v: _#folder) =
    handle v#fold_compilation_unit'
      ~continue:begin fun { payload; loc } -> match payload with
        | Program             d -> fold_program_unit' v (d &@ loc)
        | Function            d -> fold_function_unit' v (d &@ loc)
        | ClassDefinition     d -> fold_class_definition' v (d &@ loc)
        | InterfaceDefinition d -> fold_interface_definition' v (d &@ loc)
      end

  let fold_compilation_group (v: _#folder) =
    handle v#fold_compilation_group
      ~continue:(fold_list ~fold:fold_compilation_unit' v)

  (* let fold_compilation_group' (v: _#folder) = *)
  (*   handle' v#fold_compilation_group' ~fold:fold_compilation_group v *)

end