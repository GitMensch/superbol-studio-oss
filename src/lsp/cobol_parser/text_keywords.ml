(* Caution: this file was automatically generated from grammar.cmly; do not edit *)
[@@@warning "-33"] (* <- do not warn on unused opens *)

let keywords = Grammar_tokens.[
  "ZERO-FILL", ZERO_FILL;
  "ZERO", ZERO;
  "ZEROES", ZERO;
  "ZEROS", ZERO;
  "YYYYMMDD", YYYYMMDD;
  "YYYYDDD", YYYYDDD;
  "Y", Y;
  "XOR", XOR;
  "XML-SCHEMA", XML_SCHEMA;
  "XML-DECLARATION", XML_DECLARATION;
  "XML", XML;
  "X", X;
  "WRITE-VERIFY", WRITE_VERIFY;
  "WRITE-ONLY", WRITE_ONLY;
  "WRITERS", WRITERS;
  "WRITE", WRITE;
  "WRAP", WRAP;
  "WORKING-STORAGE", WORKING_STORAGE;
  "WORDS", WORDS;
  "WITH", WITH;
  "WINDOW", WINDOW;
  "WIDTH-IN-CELLS", WIDTH_IN_CELLS;
  "WIDTH", WIDTH;
  "WHEN", WHEN;
  "WEB-BROWSER", WEB_BROWSER;
  "WAIT", WAIT;
  "VTOP", VTOP;
  "VSCROLL-POS", VSCROLL_POS;
  "VSCROLL-BAR", VSCROLL_BAR;
  "VSCROLL", VSCROLL;
  "VPADDING", VPADDING;
  "VOLATILE", VOLATILE;
  "VIRTUAL-WIDTH", VIRTUAL_WIDTH;
  "VERY-HEAVY", VERY_HEAVY;
  "VERTICAL", VERTICAL;
  "VARYING", VARYING;
  "VARIANT", VARIANT;
  "VARIABLE", VARIABLE;
  "VALUE-FORMAT", VALUE_FORMAT;
  "VALUES", VALUES;
  "VALUE", VALUE;
  "VALIDATING", VALIDATING;
  "VALIDATE-STATUS", VALIDATE_STATUS;
  "VAL-STATUS", VALIDATE_STATUS;
  "VALIDATE", VALIDATE;
  "VALID", VALID;
  "V", V;
  "UTF-8", UTF_8;
  "UTF-16", UTF_16;
  "USING", USING;
  "USE-TAB", USE_TAB;
  "USE-RETURN", USE_RETURN;
  "USE-ALT", USE_ALT;
  "USER-DEFAULT", USER_DEFAULT;
  "USER", USER;
  "USE", USE;
  "USAGE", USAGE;
  "UPPER", UPPER;
  "UPON", UPON;
  "UPDATERS", UPDATERS;
  "UPDATE", UPDATE;
  "UP", UP;
  "UNTIL", UNTIL;
  "UNSTRING", UNSTRING;
  "UNSORTED", UNSORTED;
  "UNSIGNED-SHORT", UNSIGNED_SHORT;
  "UNSIGNED-LONG", UNSIGNED_LONG;
  "UNSIGNED-INT", UNSIGNED_INT;
  "UNSIGNED", UNSIGNED;
  "UNLOCK", UNLOCK;
  "UNIVERSAL", UNIVERSAL;
  "UNIT", UNIT;
  "UNFRAMED", UNFRAMED;
  "UNDERLINE", UNDERLINE;
  "UNBOUNDED", UNBOUNDED;
  "UCS-4", UCS_4;
  "U", U;
  "TYPEDEF", TYPEDEF;
  "TYPE", TYPE;
  "TRUNCATION", TRUNCATION;
  "TRUE", TRUE;
  "TREE-VIEW", TREE_VIEW;
  "TRANSPARENT", TRANSPARENT;
  "TRANSFORM", TRANSFORM;
  "TRAILING-SIGN", TRAILING_SIGN;
  "TRAILING-SHIFT", TRAILING_SHIFT;
  "TRAILING", TRAILING;
  "TRADITIONAL-FONT", TRADITIONAL_FONT;
  "TRACK-LIMIT", TRACK_LIMIT;
  "TRACK-AREA", TRACK_AREA;
  "TRACKS", TRACKS;
  "TRACK", TRACK;
  "TOWARD-LESSER", TOWARD_LESSER;
  "TOWARD-GREATER", TOWARD_GREATER;
  "TOP-LEVEL", TOP_LEVEL;
  "TOP", TOP;
  "TO", TO;
  "TITLE-POSITION", TITLE_POSITION;
  "TITLE", TITLE;
  "TIME-OUT", TIME_OUT;
  "TIMES", TIMES;
  "TIME", TIME;
  "TILED-HEADINGS", TILED_HEADINGS;
  "THUMB-POSITION", THUMB_POSITION;
  "THROUGH", THROUGH;
  "THRU", THROUGH;
  "3-D", THREEDIMENSIONAL;
  "THREADS", THREADS;
  "THREAD", THREAD;
  "THEN", THEN;
  "THAN", THAN;
  "TEXT", TEXT;
  "TEST", TEST;
  "TERMINATION-VALUE", TERMINATION_VALUE;
  "TERMINATE", TERMINATE;
  "TERMINAL-INFO", TERMINAL_INFO;
  "TERMINAL", TERMINAL;
  "TEMPORARY", TEMPORARY;
  "TAPE", TAPE;
  "TALLYING", TALLYING;
  "TAB-TO-DELETE", TAB_TO_DELETE;
  "TAB-TO-ADD", TAB_TO_ADD;
  "TABLE", TABLE;
  "TAB", TAB;
  "SYSTEM-OFFSET", SYSTEM_OFFSET;
  "SYSTEM-INFO", SYSTEM_INFO;
  "SYSTEM-DEFAULT", SYSTEM_DEFAULT;
  "SYNC", SYNCHRONIZED;
  "SYNCHRONIZED", SYNCHRONIZED;
  "SYMBOLIC", SYMBOLIC;
  "SYMBOL", SYMBOL;
  "SWITCH", SWITCH;
  "SUPPRESS", SUPPRESS;
  "SUPER", SUPER;
  "SUM", SUM;
  "SUB-QUEUE-3", SUB_QUEUE_3;
  "SUB-QUEUE-2", SUB_QUEUE_2;
  "SUB-QUEUE-1", SUB_QUEUE_1;
  "SUBWINDOW", SUBWINDOW;
  "SUBTRACT", SUBTRACT;
  "STYLE", STYLE;
  "STRUCTURE", STRUCTURE;
  "STRONG", STRONG;
  "STRING", STRING;
  "STOP", STOP;
  "STEP", STEP;
  "STDCALL", STDCALL;
  "STATUS-TEXT", STATUS_TEXT;
  "STATUS-BAR", STATUS_BAR;
  "STATUS", STATUS;
  "STATIC-LIST", STATIC_LIST;
  "STATIC", STATIC;
  "STATEMENT", STATEMENT;
  "START-Y", START_Y;
  "START-X", START_X;
  "START", START;
  "STANDARD-DECIMAL", STANDARD_DECIMAL;
  "STANDARD-BINARY", STANDARD_BINARY;
  "STANDARD-2", STANDARD_2;
  "STANDARD-1", STANDARD_1;
  "STANDARD", STANDARD;
  "STACK", STACK;
  "SQUARE", SQUARE;
  "SPINNER", SPINNER;
  "SPECIAL-NAMES", SPECIAL_NAMES;
  "SPACE-FILL", SPACE_FILL;
  "SPACE", SPACE;
  "SPACES", SPACE;
  "SOURCE-COMPUTER", SOURCE_COMPUTER;
  "SOURCES", SOURCES;
  "SOURCE", SOURCE;
  "SORT-ORDER", SORT_ORDER;
  "SORT-MERGE", SORT_MERGE;
  "SORT", SORT;
  "SMALL-FONT", SMALL_FONT;
  "SIZE", SIZE;
  "SIGNED-SHORT", SIGNED_SHORT;
  "SIGNED-LONG", SIGNED_LONG;
  "SIGNED-INT", SIGNED_INT;
  "SIGNED", SIGNED;
  "SIGN", SIGN;
  "SHOW-SEL-ALWAYS", SHOW_SEL_ALWAYS;
  "SHOW-NONE", SHOW_NONE;
  "SHOW-LINES", SHOW_LINES;
  "SHORT-DATE", SHORT_DATE;
  "SHORT", SHORT;
  "SHARING", SHARING;
  "SHADOW", SHADOW;
  "SHADING", SHADING;
  "SET", SET;
  "SEQUENTIAL", SEQUENTIAL;
  "SEQUENCE", SEQUENCE;
  "SEPARATION", SEPARATION;
  "SEPARATE", SEPARATE;
  "SENTENCE", SENTENCE;
  "SEND", SEND;
  "SELF-ACT", SELF_ACT;
  "SELF", SELF;
  "SELECT-ALL", SELECT_ALL;
  "SELECTION-TEXT", SELECTION_TEXT;
  "SELECTION-INDEX", SELECTION_INDEX;
  "SELECT", SELECT;
  "SEGMENT-LIMIT", SEGMENT_LIMIT;
  "SEGMENT", SEGMENT;
  "SECURITY", SECURITY;
  "SECURE", SECURE;
  "SECTION", SECTION;
  "SECONDS", SECONDS;
  "SEARCH-TEXT", SEARCH_TEXT;
  "SEARCH-OPTIONS", SEARCH_OPTIONS;
  "SEARCH", SEARCH;
  "SD", SD;
  "SCROLL-BAR", SCROLL_BAR;
  "SCROLL", SCROLL;
  "SCREEN", SCREEN;
  "SAVE-AS-NO-PROMPT", SAVE_AS_NO_PROMPT;
  "SAVE-AS", SAVE_AS;
  "SAME", SAME;
  "S", S;
  "RUN", RUN;
  "ROW-PROTECTION", ROW_PROTECTION;
  "ROW-HEADINGS", ROW_HEADINGS;
  "ROW-FONT", ROW_FONT;
  "ROW-DIVIDERS", ROW_DIVIDERS;
  "ROW-COLOR-PATTERN", ROW_COLOR_PATTERN;
  "ROW-COLOR", ROW_COLOR;
  "ROUNDING", ROUNDING;
  "ROUNDED", ROUNDED;
  "ROLLBACK", ROLLBACK;
  "RIMMED", RIMMED;
  "RIGHT-JUSTIFY", RIGHT_JUSTIFY;
  "RIGHT-ALIGN", RIGHT_ALIGN;
  "RIGHT", RIGHT;
  "RH", RH;
  "RF", RF;
  "REWRITE", REWRITE;
  "REWIND", REWIND;
  "REVERSE-VIDEO", REVERSE_VIDEO;
  "REVERSED", REVERSED;
  "REVERSE", REVERSE;
  "RETURNING", RETURNING;
  "RETURN", RETURN;
  "RETRY", RETRY;
  "RESUME", RESUME;
  "RESET-TABS", RESET_TABS;
  "RESET-LIST", RESET_LIST;
  "RESET-GRID", RESET_GRID;
  "RESET", RESET;
  "RESERVE", RESERVE;
  "RERUN", RERUN;
  "REREAD", REREAD;
  "REQUIRED", REQUIRED;
  "REPOSITORY", REPOSITORY;
  "REPORTS", REPORTS;
  "REPORTING", REPORTING;
  "REPORT", REPORT;
  "REPLACING", REPLACING;
  "REPLACE", REPLACE;
  "REPEATED", REPEATED;
  "REORG-CRITERIA", REORG_CRITERIA;
  "RENAMES", RENAMES;
  "REMOVAL", REMOVAL;
  "REMARKS", REMARKS;
  "REMAINDER", REMAINDER;
  "RELEASE", RELEASE;
  "RELATIVE", RELATIVE;
  "RELATION", RELATION;
  "REGION-COLOR", REGION_COLOR;
  "REFRESH", REFRESH;
  "REFERENCES", REFERENCES;
  "REFERENCE", REFERENCE;
  "REEL", REEL;
  "REDEFINES", REDEFINES;
  "RECURSIVE", RECURSIVE;
  "RECORD-TO-DELETE", RECORD_TO_DELETE;
  "RECORD-TO-ADD", RECORD_TO_ADD;
  "RECORD-OVERFLOW", RECORD_OVERFLOW;
  "RECORD-DATA", RECORD_DATA;
  "RECORDS", RECORDS;
  "RECORDING", RECORDING;
  "RECORD", RECORD;
  "RECEIVED", RECEIVED;
  "RECEIVE", RECEIVE;
  "READ-ONLY", READ_ONLY;
  "READERS", READERS;
  "READ", READ;
  "RD", RD;
  "RANDOM", RANDOM;
  "RAISING", RAISING;
  "RAISED", RAISED;
  "RAISE", RAISE;
  "RADIO-BUTTON", RADIO_BUTTON;
  "QUOTE", QUOTE;
  "QUOTES", QUOTE;
  "QUEUE", QUEUE;
  "QUERY-INDEX", QUERY_INDEX;
  "PUSH-BUTTON", PUSH_BUTTON;
  "PURGE", PURGE;
  "PROTOTYPE", PROTOTYPE;
  "PROTECTED", PROTECTED;
  "PROPERTY", PROPERTY;
  "PROPERTIES", PROPERTIES;
  "PROMPT", PROMPT;
  "PROHIBITED", PROHIBITED;
  "PROGRESS", PROGRESS;
  "PROGRAM-POINTER", PROGRAM_POINTER;
  "PROGRAM-ID", PROGRAM_ID;
  "PROGRAM", PROGRAM;
  "PROCESSING", PROCESSING;
  "PROCEED", PROCEED;
  "PROCEDURE-POINTER", PROCEDURE_POINTER;
  "PROCEDURES", PROCEDURES;
  "PROCEDURE", PROCEDURE;
  "PRIORITY", PRIORITY;
  "PRINT-PREVIEW", PRINT_PREVIEW;
  "PRINT-NO-PROMPT", PRINT_NO_PROMPT;
  "PRINTING", PRINTING;
  "PRINTER-1", PRINTER_1;
  "PRINTER", PRINTER;
  "PRINT", PRINT;
  "PREVIOUS", PREVIOUS;
  "PRESENT", PRESENT;
  "PREFIXED", PREFIXED;
  "POSITIVE", POSITIVE;
  "POSITION-SHIFT", POSITION_SHIFT;
  "POSITION", POSITION;
  "POS", POS;
  "POP-UP", POP_UP;
  "POINTER", POINTER;
  "PLUS", PLUS;
  "PLACEMENT", PLACEMENT;
  "PIXEL", PIXEL;
  "PIC", PICTURE;
  "PICTURE", PICTURE;
  "PHYSICAL", PHYSICAL;
  "PH", PH;
  "PF", PF;
  "PERMANENT", PERMANENT;
  "PERFORM", PERFORM;
  "PASSWORD", PASSWORD;
  "PASCAL", PASCAL;
  "PARSE", PARSE;
  "PARENT", PARENT;
  "PARAGRAPH", PARAGRAPH;
  "PAGE-SETUP", PAGE_SETUP;
  "PAGE-COUNTER", PAGE_COUNTER;
  "PAGED", PAGED;
  "PAGE", PAGE;
  "PADDING", PADDING;
  "PACKED-DECIMAL", PACKED_DECIMAL;
  "OVERRIDE", OVERRIDE;
  "OVERLINE", OVERLINE;
  "OVERLAP-TOP", OVERLAP_TOP;
  "OVERLAP-LEFT", OVERLAP_LEFT;
  "OVERFLOW", OVERFLOW;
  "OUTPUT", OUTPUT;
  "OTHERS", OTHERS;
  "OTHER", OTHER;
  "ORGANIZATION", ORGANIZATION;
  "ORDER", ORDER;
  "OR", OR;
  "OPTIONS", OPTIONS;
  "OPTIONAL", OPTIONAL;
  "OPEN", OPEN;
  "ONLY", ONLY;
  "ON", ON;
  "OMITTED", OMITTED;
  "OK-BUTTON", OK_BUTTON;
  "OFF", OFF;
  "OF", OF;
  "OCCURS", OCCURS;
  "OBJECT-REFERENCE", OBJECT_REFERENCE;
  "OBJECT-COMPUTER", OBJECT_COMPUTER;
  "OBJECT", OBJECT;
  "NUM-ROWS", NUM_ROWS;
  "NUM-COL-HEADINGS", NUM_COL_HEADINGS;
  "NUMERIC-EDITED", NUMERIC_EDITED;
  "NUMERIC", NUMERIC;
  "NUMBERS", NUMBERS;
  "NUMBER", NUMBER;
  "NULLS", NULLS;
  "NULL", NULL;
  "NO-UPDOWN", NO_UPDOWN;
  "NO-SEARCH", NO_SEARCH;
  "NO-KEY-LETTER", NO_KEY_LETTER;
  "NO-GROUP-TAB", NO_GROUP_TAB;
  "NO-FOCUS", NO_FOCUS;
  "NO-F4", NO_F4;
  "NO-ECHO", NO_ECHO;
  "NO-DIVIDERS", NO_DIVIDERS;
  "NO-BOX", NO_BOX;
  "NO-AUTO-DEFAULT", NO_AUTO_DEFAULT;
  "NO-AUTOSEL", NO_AUTOSEL;
  "NOTIFY-SELCHANGE", NOTIFY_SELCHANGE;
  "NOTIFY-DBLCLICK", NOTIFY_DBLCLICK;
  "NOTIFY-CHANGE", NOTIFY_CHANGE;
  "NOTIFY", NOTIFY;
  "NOTHING", NOTHING;
  "NOTAB", NOTAB;
  "NOT", NOT;
  "NORMAL", NORMAL;
  "NONNUMERIC", NONNUMERIC;
  "NONE", NONE;
  "NOMINAL", NOMINAL;
  "NO", NO;
  "NEXT-ITEM", NEXT_ITEM;
  "NEXT", NEXT;
  "NEW", NEW;
  "NESTED", NESTED;
  "NEGATIVE", NEGATIVE;
  "NEAREST-TO-ZERO", NEAREST_TO_ZERO;
  "NEAREST-TOWARD-ZERO", NEAREST_TOWARD_ZERO;
  "NEAREST-EVEN", NEAREST_EVEN;
  "NEAREST-AWAY-FROM-ZERO", NEAREST_AWAY_FROM_ZERO;
  "NAVIGATE-URL", NAVIGATE_URL;
  "NATIVE", NATIVE;
  "NATIONAL-EDITED", NATIONAL_EDITED;
  "NATIONAL", NATIONAL;
  "NAT", NAT;
  "NAMESPACE-PREFIX", NAMESPACE_PREFIX;
  "NAMESPACE", NAMESPACE;
  "NAMED", NAMED;
  "NAME", NAME;
  "MULTIPLY", MULTIPLY;
  "MULTIPLE", MULTIPLE;
  "MULTILINE", MULTILINE;
  "MOVE", MOVE;
  "MODULES", MODULES;
  "MODIFY", MODIFY;
  "MODE", MODE;
  "MIN-VAL", MIN_VAL;
  "MINUS", MINUS;
  "MICROSECOND-TIME", MICROSECOND_TIME;
  "METHOD-ID", METHOD_ID;
  "METHOD", METHOD;
  "MESSAGE-TAG", MESSAGE_TAG;
  "MESSAGE", MESSAGE;
  "MERGE", MERGE;
  "MENU", MENU;
  "MEMORY", MEMORY;
  "MEDIUM-FONT", MEDIUM_FONT;
  "MAX-VAL", MAX_VAL;
  "MAX-TEXT", MAX_TEXT;
  "MAX-PROGRESS", MAX_PROGRESS;
  "MAX-LINES", MAX_LINES;
  "MASTER-INDEX", MASTER_INDEX;
  "MASS-UPDATE", MASS_UPDATE;
  "MANUAL", MANUAL;
  "MAGNETIC-TAPE", MAGNETIC_TAPE;
  "LOW-VALUE", LOW_VALUE;
  "LOW-VALUES", LOW_VALUE;
  "LOW-COLOR", LOW_COLOR;
  "LOWLIGHT", LOWLIGHT;
  "LOWERED", LOWERED;
  "LOWER", LOWER;
  "LONG-DATE", LONG_DATE;
  "LOCK-HOLDING", LOCK_HOLDING;
  "LOCK", LOCK;
  "LOCATION", LOCATION;
  "LOCAL-STORAGE", LOCAL_STORAGE;
  "LOCALE", LOCALE;
  "LOC", LOC;
  "LM-RESIZE", LM_RESIZE;
  "LIST-BOX", LIST_BOX;
  "LINKAGE", LINKAGE;
  "LINE-SEQUENTIAL", LINE_SEQUENTIAL;
  "LINE-COUNTER", LINE_COUNTER;
  "LINES-AT-ROOT", LINES_AT_ROOT;
  "LINES", LINES;
  "LINE", LINE;
  "LINAGE-COUNTER", LINAGE_COUNTER;
  "LINAGE", LINAGE;
  "LIMITS", LIMITS;
  "LIMIT", LIMIT;
  "LIKE", LIKE;
  "LIBRARY", LIBRARY;
  "LESS", LESS;
  "LENGTH", LENGTH;
  "LEFT-TEXT", LEFT_TEXT;
  "LEFT-JUSTIFY", LEFT_JUSTIFY;
  "LEFTLINE", LEFTLINE;
  "LEFT", LEFT;
  "LEAVE", LEAVE;
  "LEADING-SHIFT", LEADING_SHIFT;
  "LEADING", LEADING;
  "LC_TIME", LC_TIME;
  "LC_NUMERIC", LC_NUMERIC;
  "LC_MONETARY", LC_MONETARY;
  "LC_MESSAGES", LC_MESSAGES;
  "LC_CTYPE", LC_CTYPE;
  "LC_COLLATE", LC_COLLATE;
  "LC_ALL", LC_ALL;
  "LAYOUT-MANAGER", LAYOUT_MANAGER;
  "LAYOUT-DATA", LAYOUT_DATA;
  "LAST-ROW", LAST_ROW;
  "LAST", LAST;
  "LARGE-OFFSET", LARGE_OFFSET;
  "LARGE-FONT", LARGE_FONT;
  "LABEL-OFFSET", LABEL_OFFSET;
  "LABEL", LABEL;
  "KEYBOARD", KEYBOARD;
  "KEY", KEY;
  "KEPT", KEPT;
  "JUST", JUSTIFIED;
  "JUSTIFIED", JUSTIFIED;
  "JSON", JSON;
  "I-O-CONTROL", I_O_CONTROL;
  "I-O", I_O;
  "ITEM-VALUE", ITEM_VALUE;
  "ITEM-TO-EMPTY", ITEM_TO_EMPTY;
  "ITEM-TO-DELETE", ITEM_TO_DELETE;
  "ITEM-TO-ADD", ITEM_TO_ADD;
  "ITEM-TEXT", ITEM_TEXT;
  "ITEM", ITEM;
  "IS", IS;
  "IN-ARITHMETIC-RANGE", IN_ARITHMETIC_RANGE;
  "INVOKE", INVOKE;
  "INVALID", INVALID;
  "INTRINSIC", INTRINSIC;
  "INTO", INTO;
  "INTERMEDIATE", INTERMEDIATE;
  "INTERFACE-ID", INTERFACE_ID;
  "INTERFACE", INTERFACE;
  "INSTALLATION", INSTALLATION;
  "INSPECT", INSPECT;
  "INSERT-ROWS", INSERT_ROWS;
  "INSERTION-INDEX", INSERTION_INDEX;
  "INQUIRE", INQUIRE;
  "INPUT-OUTPUT", INPUT_OUTPUT;
  "INPUT", INPUT;
  "INITIATE", INITIATE;
  "INITIALIZED", INITIALIZED;
  "INITIALIZE", INITIALIZE;
  "INITIAL", INITIAL;
  "INHERITS", INHERITS;
  "INDICATE", INDICATE;
  "INDEXED", INDEXED;
  "INDEX", INDEX;
  "INDEPENDENT", INDEPENDENT;
  "IN", IN;
  "IMPLEMENTS", IMPLEMENTS;
  "IGNORING", IGNORING;
  "IGNORE", IGNORE;
  "IF", IF;
  "IDENTIFIED", IDENTIFIED;
  "IDENTIFICATION", IDENTIFICATION;
  "ID", ID;
  "ICON", ICON;
  "HSCROLL-POS", HSCROLL_POS;
  "HSCROLL", HSCROLL;
  "HOT-TRACK", HOT_TRACK;
  "HIGH-VALUE", HIGH_VALUE;
  "HIGH-VALUES", HIGH_VALUE;
  "HIGH-ORDER-RIGHT", HIGH_ORDER_RIGHT;
  "HIGH-ORDER-LEFT", HIGH_ORDER_LEFT;
  "HIGH-COLOR", HIGH_COLOR;
  "HIGHLIGHT", HIGHLIGHT;
  "HIDDEN-DATA", HIDDEN_DATA;
  "HEX", HEX;
  "HEIGHT-IN-CELLS", HEIGHT_IN_CELLS;
  "HEAVY", HEAVY;
  "HEADING-FONT", HEADING_FONT;
  "HEADING-DIVIDER-COLOR", HEADING_DIVIDER_COLOR;
  "HEADING-COLOR", HEADING_COLOR;
  "HEADING", HEADING;
  "HAS-CHILDREN", HAS_CHILDREN;
  "HANDLE", HANDLE;
  "GROUP-VALUE", GROUP_VALUE;
  "GROUP-USAGE", GROUP_USAGE;
  "GROUP", GROUP;
  "GRID", GRID;
  "GREATER", GREATER;
  "GRAPHICAL", GRAPHICAL;
  "GO-SEARCH", GO_SEARCH;
  "GO-HOME", GO_HOME;
  "GO-FORWARD", GO_FORWARD;
  "GO-BACK", GO_BACK;
  "GOBACK", GOBACK;
  "GO", GO;
  "GLOBAL", GLOBAL;
  "GIVING", GIVING;
  "GET", GET;
  "GENERATE", GENERATE;
  "FUNCTION-POINTER", FUNCTION_POINTER;
  "FUNCTION-ID", FUNCTION_ID;
  "FUNCTION", FUNCTION;
  "FULL-HEIGHT", FULL_HEIGHT;
  "FULL", FULL;
  "FROM", FROM;
  "FREE", FREE;
  "FRAMED", FRAMED;
  "FRAME", FRAME;
  "FORMAT", FORMAT;
  "FOREVER", FOREVER;
  "FOREGROUND-COLOR", FOREGROUND_COLOR;
  "FOR", FOR;
  "FOOTING", FOOTING;
  "FONT", FONT;
  "FLOAT-SHORT", FLOAT_SHORT;
  "FLOAT-NOT-A-NUMBER-SIGNALING", FLOAT_NOT_A_NUMBER_SIGNALING;
  "FLOAT-NOT-A-NUMBER-QUIET", FLOAT_NOT_A_NUMBER_QUIET;
  "FLOAT-NOT-A-NUMBER", FLOAT_NOT_A_NUMBER;
  "FLOAT-LONG", FLOAT_LONG;
  "FLOAT-INFINITY", FLOAT_INFINITY;
  "FLOAT-EXTENDED", FLOAT_EXTENDED;
  "FLOAT-DECIMAL-34", FLOAT_DECIMAL_34;
  "FLOAT-DECIMAL-16", FLOAT_DECIMAL_16;
  "FLOAT-DECIMAL", FLOAT_DECIMAL;
  "FLOAT-BINARY-64", FLOAT_BINARY_64;
  "FLOAT-BINARY-32", FLOAT_BINARY_32;
  "FLOAT-BINARY-128", FLOAT_BINARY_128;
  "FLOAT-BINARY", FLOAT_BINARY;
  "FLOATING", FLOATING;
  "FLOAT", FLOAT;
  "FLAT-BUTTONS", FLAT_BUTTONS;
  "FLAT", FLAT;
  "FIXED-WIDTH", FIXED_WIDTH;
  "FIXED-FONT", FIXED_FONT;
  "FIXED", FIXED;
  "FIRST", FIRST;
  "FINISH-REASON", FINISH_REASON;
  "FINALLY", FINALLY;
  "FINAL", FINAL;
  "FILL-PERCENT", FILL_PERCENT;
  "FILL-COLOR2", FILL_COLOR2;
  "FILL-COLOR", FILL_COLOR;
  "FILLER", FILLER;
  "FILE-POS", FILE_POS;
  "FILE-NAME", FILE_NAME;
  "FILE-LIMITS", FILE_LIMITS;
  "FILE-LIMIT", FILE_LIMIT;
  "FILE-ID", FILE_ID;
  "FILE-CONTROL", FILE_CONTROL;
  "FILE", FILE;
  "FH--KEYDEF", FH__KEYDEF;
  "FH--FCD", FH__FCD;
  "FD", FD;
  "FARTHEST-FROM-ZERO", FARTHEST_FROM_ZERO;
  "FALSE", FALSE;
  "FACTORY", FACTORY;
  "F", F;
  "EXTERNAL-FORM", EXTERNAL_FORM;
  "EXTERNAL", EXTERNAL;
  "EXTERN", EXTERN;
  "EXTENDED-SEARCH", EXTENDED_SEARCH;
  "EXTEND", EXTEND;
  "EXPANDS", EXPANDS;
  "EXPAND", EXPAND;
  "EXIT", EXIT;
  "EXHIBIT", EXHIBIT;
  "EXCLUSIVE-OR", EXCLUSIVE_OR;
  "EXCLUSIVE", EXCLUSIVE;
  "EXCEPTION-VALUE", EXCEPTION_VALUE;
  "EXCEPTION-OBJECT", EXCEPTION_OBJECT;
  "EXCEPTION", EXCEPTION;
  "EXAMINE", EXAMINE;
  "EVERY", EVERY;
  "EVENT-LIST", EVENT_LIST;
  "EVENT", EVENT;
  "EVALUATE", EVALUATE;
  "ESI", ESI;
  "ESCAPE-BUTTON", ESCAPE_BUTTON;
  "ESCAPE", ESCAPE;
  "ERROR", ERROR;
  "ERASE", ERASE;
  "EQUAL", EQUAL;
  "EOS", EOS;
  "EOP", EOP;
  "EOL", EOL;
  "EO", EO;
  "ENVIRONMENT-VALUE", ENVIRONMENT_VALUE;
  "ENVIRONMENT-NAME", ENVIRONMENT_NAME;
  "ENVIRONMENT", ENVIRONMENT;
  "ENTRY-REASON", ENTRY_REASON;
  "ENTRY-FIELD", ENTRY_FIELD;
  "ENTRY-CONVENTION", ENTRY_CONVENTION;
  "ENTRY", ENTRY;
  "ENTER", ENTER;
  "ENSURE-VISIBLE", ENSURE_VISIBLE;
  "ENGRAVED", ENGRAVED;
  "END-XML", END_XML;
  "END-WRITE", END_WRITE;
  "END-UNSTRING", END_UNSTRING;
  "END-SUBTRACT", END_SUBTRACT;
  "END-STRING", END_STRING;
  "END-START", END_START;
  "END-SEND", END_SEND;
  "END-SEARCH", END_SEARCH;
  "END-REWRITE", END_REWRITE;
  "END-RETURN", END_RETURN;
  "END-RECEIVE", END_RECEIVE;
  "END-READ", END_READ;
  "END-PERFORM", END_PERFORM;
  "END-OF-PAGE", END_OF_PAGE;
  "END-MULTIPLY", END_MULTIPLY;
  "END-MODIFY", END_MODIFY;
  "END-JSON", END_JSON;
  "END-IF", END_IF;
  "END-EVALUATE", END_EVALUATE;
  "END-DIVIDE", END_DIVIDE;
  "END-DISPLAY", END_DISPLAY;
  "END-DELETE", END_DELETE;
  "END-COMPUTE", END_COMPUTE;
  "END-COLOR", END_COLOR;
  "END-CHAIN", END_CHAIN;
  "END-CALL", END_CALL;
  "END-ADD", END_ADD;
  "END-ACCEPT", END_ACCEPT;
  "END", END;
  "ENCRYPTION", ENCRYPTION;
  "ENCODING", ENCODING;
  "ENABLE", ENABLE;
  "EMI", EMI;
  "ELSE", ELSE;
  "ELEMENT", ELEMENT;
  "EGI", EGI;
  "EDITING", EDITING;
  "ECHO", ECHO;
  "EC", EC;
  "EBCDIC", EBCDIC;
  "DYNAMIC", DYNAMIC;
  "DUPLICATES", DUPLICATES;
  "DROP-LIST", DROP_LIST;
  "DROP-DOWN", DROP_DOWN;
  "DRAG-COLOR", DRAG_COLOR;
  "DOWN", DOWN;
  "DOUBLE", DOUBLE;
  "DOTTED", DOTTED;
  "DOTDASH", DOTDASH;
  "DIVISION", DIVISION;
  "DIVIDER-COLOR", DIVIDER_COLOR;
  "DIVIDERS", DIVIDERS;
  "DIVIDE", DIVIDE;
  "DISPLAY-FORMAT", DISPLAY_FORMAT;
  "DISPLAY-COLUMNS", DISPLAY_COLUMNS;
  "DISPLAY-1", DISPLAY_1;
  "DISPLAY", DISPLAY;
  "DISP", DISP;
  "DISK", DISK;
  "DISC", DISC;
  "DISABLE", DISABLE;
  "DE", DETAIL;
  "DETAIL", DETAIL;
  "DESTROY", DESTROY;
  "DESTINATION", DESTINATION;
  "DESCENDING", DESCENDING;
  "DEPENDING", DEPENDING;
  "DELIMITER", DELIMITER;
  "DELIMITED", DELIMITED;
  "DELETE", DELETE;
  "DEFINITION", DEFINITION;
  "DEFAULT-FONT", DEFAULT_FONT;
  "DEFAULT-BUTTON", DEFAULT_BUTTON;
  "DEFAULT", DEFAULT;
  "DECLARATIVES", DECLARATIVES;
  "DECIMAL-POINT", DECIMAL_POINT;
  "DECIMAL-ENCODING", DECIMAL_ENCODING;
  "DEBUGGING", DEBUGGING;
  "DAY-OF-WEEK", DAY_OF_WEEK;
  "DAY", DAY;
  "DATE-WRITTEN", DATE_WRITTEN;
  "DATE-MODIFIED", DATE_MODIFIED;
  "DATE-ENTRY", DATE_ENTRY;
  "DATE-COMPILED", DATE_COMPILED;
  "DATE", DATE;
  "DATA-TYPES", DATA_TYPES;
  "DATA-POINTER", DATA_POINTER;
  "DATA-COLUMNS", DATA_COLUMNS;
  "DATA", DATA;
  "DASHED", DASHED;
  "CYL-OVERFLOW", CYL_OVERFLOW;
  "CYL-INDEX", CYL_INDEX;
  "CYCLE", CYCLE;
  "CUSTOM-PRINT-TEMPLATE", CUSTOM_PRINT_TEMPLATE;
  "CURSOR-Y", CURSOR_Y;
  "CURSOR-X", CURSOR_X;
  "CURSOR-ROW", CURSOR_ROW;
  "CURSOR-FRAME-WIDTH", CURSOR_FRAME_WIDTH;
  "CURSOR-COLOR", CURSOR_COLOR;
  "CURSOR-COL", CURSOR_COL;
  "CURSOR", CURSOR;
  "CURRENT", CURRENT;
  "CURRENCY", CURRENCY;
  "CSIZE", CSIZE;
  "CRT-UNDER", CRT_UNDER;
  "CRT", CRT;
  "COUNT", COUNT;
  "CORR", CORRESPONDING;
  "CORRESPONDING", CORRESPONDING;
  "CORE-INDEX", CORE_INDEX;
  "COPY-SELECTION", COPY_SELECTION;
  "COPY", COPY;
  "CONVERTING", CONVERTING;
  "CONVERSION", CONVERSION;
  "CONTROLS", CONTROLS;
  "CONTROL", CONTROL;
  "CONTINUE", CONTINUE;
  "CONTENT", CONTENT;
  "CONTAINS", CONTAINS;
  "CONSTANT", CONSTANT;
  "CONFIGURATION", CONFIGURATION;
  "CONDITION", CONDITION;
  "COMPUTATIONAL-X", COMP_X;
  "COMP-X", COMP_X;
  "COMPUTATIONAL-N", COMP_N;
  "COMP-N", COMP_N;
  "COMP-9", COMP_9;
  "COMPUTATIONAL-6", COMP_6;
  "COMP-6", COMP_6;
  "COMPUTATIONAL-5", COMP_5;
  "COMP-5", COMP_5;
  "COMPUTATIONAL-4", COMP_4;
  "COMP-4", COMP_4;
  "COMPUTATIONAL-3", COMP_3;
  "COMP-3", COMP_3;
  "COMPUTATIONAL-2", COMP_2;
  "COMP-2", COMP_2;
  "COMP-15", COMP_15;
  "COMP-10", COMP_10;
  "COMPUTATIONAL-1", COMP_1;
  "COMP-1", COMP_1;
  "COMPUTATIONAL-0", COMP_0;
  "COMP-0", COMP_0;
  "COMPUTE", COMPUTE;
  "COMPUTATIONAL", COMP;
  "COMP", COMP;
  "COMMUNICATION", COMMUNICATION;
  "COMMON", COMMON;
  "COMMIT", COMMIT;
  "COMMAND-LINE", COMMAND_LINE;
  "COMMA", COMMA;
  "COMBO-BOX", COMBO_BOX;
  "COLUMN-PROTECTION", COLUMN_PROTECTION;
  "COLUMN-HEADINGS", COLUMN_HEADINGS;
  "COLUMN-FONT", COLUMN_FONT;
  "COLUMN-DIVIDERS", COLUMN_DIVIDERS;
  "COLUMN-COLOR", COLUMN_COLOR;
  "COLUMNS", COLUMNS;
  "COLS", COLUMNS;
  "COLUMN", COLUMN;
  "COLORS", COLORS;
  "COLOR", COLOR;
  "COLLATING", COLLATING;
  "COL", COL;
  "CODE-SET", CODE_SET;
  "CODE", CODE;
  "COBOL", COBOL;
  "CLOSE", CLOSE;
  "CLOCK-UNITS", CLOCK_UNITS;
  "CLINES", CLINES;
  "CLINE", CLINE;
  "CLEAR-SELECTION", CLEAR_SELECTION;
  "CLASS-ID", CLASS_ID;
  "CLASSIFICATION", CLASSIFICATION;
  "CLASS", CLASS;
  "CHECK-BOX", CHECK_BOX;
  "CHARACTERS", CHARACTERS;
  "CHARACTER", CHARACTER;
  "CHANGED", CHANGED;
  "CHAINING", CHAINING;
  "CHAIN", CHAIN;
  "CH", CH;
  "CF", CF;
  "CENTURY-DATE", CENTURY_DATE;
  "CENTERED-HEADINGS", CENTERED_HEADINGS;
  "CENTERED", CENTERED;
  "CENTER", CENTER;
  "CELL-PROTECTION", CELL_PROTECTION;
  "CELL-FONT", CELL_FONT;
  "CELL-DATA", CELL_DATA;
  "CELL-COLOR", CELL_COLOR;
  "CELL", CELL;
  "CD", CD;
  "CCOL", CCOL;
  "CASSETTE", CASSETTE;
  "CARD-READER", CARD_READER;
  "CARD-PUNCH", CARD_PUNCH;
  "CAPACITY", CAPACITY;
  "CANCEL-BUTTON", CANCEL_BUTTON;
  "CANCEL", CANCEL;
  "CALL", CALL;
  "CALENDAR-FONT", CALENDAR_FONT;
  "C", C;
  "B-XOR", B_XOR;
  "B-SHIFT-RC", B_SHIFT_RC;
  "B-SHIFT-R", B_SHIFT_R;
  "B-SHIFT-LC", B_SHIFT_LC;
  "B-SHIFT-L", B_SHIFT_L;
  "B-OR", B_OR;
  "B-NOT", B_NOT;
  "B-AND", B_AND;
  "BYTE-LENGTH", BYTE_LENGTH;
  "BYTES", BYTES;
  "BYTE", BYTE;
  "BY", BY;
  "BUTTONS", BUTTONS;
  "BUSY", BUSY;
  "BULK-ADDITION", BULK_ADDITION;
  "BOXED", BOXED;
  "BOX", BOX;
  "BOTTOM", BOTTOM;
  "BOOLEAN", BOOLEAN;
  "BLOCK", BLOCK;
  "BLINK", BLINK;
  "BLANK", BLANK;
  "BITMAP-WIDTH", BITMAP_WIDTH;
  "BITMAP-TRANSPARENT-COLOR", BITMAP_TRANSPARENT_COLOR;
  "BITMAP-TRAILING", BITMAP_TRAILING;
  "BITMAP-TIMER", BITMAP_TIMER;
  "BITMAP-START", BITMAP_START;
  "BITMAP-NUMBER", BITMAP_NUMBER;
  "BITMAP-HANDLE", BITMAP_HANDLE;
  "BITMAP-END", BITMAP_END;
  "BITMAP", BITMAP;
  "BIT", BIT;
  "BINARY-SHORT", BINARY_SHORT;
  "BINARY-SEQUENTIAL", BINARY_SEQUENTIAL;
  "BINARY-LONG", BINARY_LONG;
  "BINARY-ENCODING", BINARY_ENCODING;
  "BINARY-DOUBLE", BINARY_DOUBLE;
  "BINARY-C-LONG", BINARY_C_LONG;
  "BINARY-CHAR", BINARY_CHAR;
  "BINARY", BINARY;
  "BELL", BELL;
  "BEFORE", BEFORE;
  "BASED", BASED;
  "BAR", BAR;
  "BACKWARD", BACKWARD;
  "BACKGROUND-STANDARD", BACKGROUND_STANDARD;
  "BACKGROUND-LOW", BACKGROUND_LOW;
  "BACKGROUND-HIGH", BACKGROUND_HIGH;
  "BACKGROUND-COLOR", BACKGROUND_COLOR;
  "AWAY-FROM-ZERO", AWAY_FROM_ZERO;
  "AUTO-SPIN", AUTO_SPIN;
  "AUTO-DECIMAL", AUTO_DECIMAL;
  "AUTOMATIC", AUTOMATIC;
  "AUTO", AUTO;
  "AUTHOR", AUTHOR;
  "ATTRIBUTES", ATTRIBUTES;
  "ATTRIBUTE", ATTRIBUTE;
  "AT", AT;
  "ASSIGN", ASSIGN;
  "ASCII", ASCII;
  "ASCENDING", ASCENDING;
  "AS", AS;
  "ARITHMETIC", ARITHMETIC;
  "ARGUMENT-VALUE", ARGUMENT_VALUE;
  "ARGUMENT-NUMBER", ARGUMENT_NUMBER;
  "AREAS", AREAS;
  "AREA", AREA;
  "ARE", ARE;
  "APPLY", APPLY;
  "ANYCASE", ANYCASE;
  "ANY", ANY;
  "ANUM", ANUM;
  "AND", AND;
  "ALTERNATE", ALTERNATE;
  "ALTER", ALTER;
  "ALSO", ALSO;
  "ALPHANUMERIC-EDITED", ALPHANUMERIC_EDITED;
  "ALPHANUMERIC", ALPHANUMERIC;
  "ALPHABETIC-UPPER", ALPHABETIC_UPPER;
  "ALPHABETIC-LOWER", ALPHABETIC_LOWER;
  "ALPHABETIC", ALPHABETIC;
  "ALPHABET", ALPHABET;
  "ALLOWING", ALLOWING;
  "ALLOCATE", ALLOCATE;
  "ALL", ALL;
  "ALIGNMENT", ALIGNMENT;
  "ALIGNED", ALIGNED;
  "AFTER", AFTER;
  "ADVANCING", ADVANCING;
  "ADJUSTABLE-COLUMNS", ADJUSTABLE_COLUMNS;
  "ADDRESS", ADDRESS;
  "ADD", ADD;
  "ACTUAL", ACTUAL;
  "ACTIVE-X", ACTIVE_X;
  "ACTIVE-CLASS", ACTIVE_CLASS;
  "ACTIVATING", ACTIVATING;
  "ACTION", ACTION;
  "ACCESS", ACCESS;
  "ACCEPT", ACCEPT;
  "ABSENT", ABSENT;
]

let puncts = Grammar_tokens.[
  "/", SLASH;
  ")", RPAR;
  "+", PLUS_SIGN;
  ".", PERIOD;
  "<>", NE;
  "<", LT;
  "(", LPAR;
  "<=", LE;
  ">", GT;
  ">=", GE;
  "=", EQ;
  "::", DOUBLE_COLON;
  "**", DOUBLE_ASTERISK;
  "-", DASH_SIGN;
  ":", COLON;
  "*", ASTERISK;
  "&", AMPERSAND;
]

let silenced_keywords = Grammar_tokens.[
  "XML-TEXT"(*, XML_TEXT*);
  "XML-NTEXT"(*, XML_NTEXT*);
  "XML-EVENT"(*, XML_EVENT*);
  "WRITING"(*, WRITING*);
  "WIDE"(*, WIDE*);
  "WHILE"(*, WHILE*);
  "WHEN-COMPILED"(*, WHEN_COMPILED*);
  "VLR"(*, VLR*);
  "VISIBLE"(*, VISIBLE*);
  "VIRTUAL"(*, VIRTUAL*);
  "VIA"(*, VIA*);
  "VERSION"(*, VERSION*);
  "VARBINARY"(*, VARBINARY*);
  "USER-WHITE"(*, USER_WHITE*);
  "USER-GRAY"(*, USER_GRAY*);
  "USER-COLORS"(*, USER_COLORS*);
  "UNSEQUAL"(*, UNSEQUAL*);
  "UNEQUAL"(*, UNEQUAL*);
  "UFF"(*, UFF*);
  "TRIMMED"(*, TRIMMED*);
  "TRANSPARENT-COLOR"(*, TRANSPARENT_COLOR*);
  "TRANSACTION-STATUS"(*, TRANSACTION_STATUS*);
  "TRANSACTION"(*, TRANSACTION*);
  "TRACK-THUMB"(*, TRACK_THUMB*);
  "TRACE"(*, TRACE*);
  "TOTALING"(*, TOTALING*);
  "TOTALED"(*, TOTALED*);
  "TOOL-BAR"(*, TOOL_BAR*);
  "TITLE-BAR"(*, TITLE_BAR*);
  "TIME-RECORD"(*, TIME_RECORD*);
  "TIME-OF-DAY"(*, TIME_OF_DAY*);
  "TIMESTAMP-RECORD"(*, TIMESTAMP_RECORD*);
  "TIMESTAMP-OFFSET-RECORD"(*, TIMESTAMP_OFFSET_RECORD*);
  "TIMESTAMP-OFFSET"(*, TIMESTAMP_OFFSET*);
  "TIMESTAMP"(*, TIMESTAMP*);
  "THREAD-POINTER"(*, THREAD_POINTER*);
  "THREAD-LOCAL-STORAGE"(*, THREAD_LOCAL_STORAGE*);
  "THREAD-LOCAL"(*, THREAD_LOCAL*);
  "TERMINAL-X"(*, TERMINAL_X*);
  "TERMINAL-3"(*, TERMINAL_3*);
  "TERMINAL-2"(*, TERMINAL_2*);
  "TERMINAL-1"(*, TERMINAL_1*);
  "TERMINAL-0"(*, TERMINAL_0*);
  "TEMP"(*, TEMP*);
  "TALLY"(*, TALLY*);
  "TAB-CONTROL"(*, TAB_CONTROL*);
  "SYSTEM"(*, SYSTEM*);
  "SYSOUT-X"(*, SYSOUT_X*);
  "SYSOUT-3"(*, SYSOUT_3*);
  "SYSOUT-2"(*, SYSOUT_2*);
  "SYSOUT-1"(*, SYSOUT_1*);
  "SYSOUT-0"(*, SYSOUT_0*);
  "SYSIN-X"(*, SYSIN_X*);
  "SYSIN-3"(*, SYSIN_3*);
  "SYSIN-2"(*, SYSIN_2*);
  "SYSIN-1"(*, SYSIN_1*);
  "SYSIN-0"(*, SYSIN_0*);
  "SUFFIXING"(*, SUFFIXING*);
  "SUB-SCHEMA"(*, SUB_SCHEMA*);
  "SUBFILE"(*, SUBFILE*);
  "STRONG-NAME"(*, STRONG_NAME*);
  "STOP-BROWSER"(*, STOP_BROWSER*);
  "STATION"(*, STATION*);
  "STARTING"(*, STARTING*);
  "SSF"(*, SSF*);
  "SQL-ROWID"(*, SQL_ROWID*);
  "SQL-NCLOB"(*, SQL_NCLOB*);
  "SQL-CURSOR"(*, SQL_CURSOR*);
  "SQL-CLOB"(*, SQL_CLOB*);
  "SQL-BLOB"(*, SQL_BLOB*);
  "SQL-BFILE"(*, SQL_BFILE*);
  "SQLIMS"(*, SQLIMS*);
  "SQL"(*, SQL*);
  "SORT-WORK"(*, SORT_WORK*);
  "SORT-RETURN"(*, SORT_RETURN*);
  "SORT-MODE-SIZE"(*, SORT_MODE_SIZE*);
  "SORT-MESSAGE"(*, SORT_MESSAGE*);
  "SORT-FILE-SIZE"(*, SORT_FILE_SIZE*);
  "SORT-CORE-SIZE"(*, SORT_CORE_SIZE*);
  "SORT-CONTROL"(*, SORT_CONTROL*);
  "SKIP3"(*, SKIP3*);
  "SKIP2"(*, SKIP2*);
  "SKIP1"(*, SKIP1*);
  "SHIFT-OUT"(*, SHIFT_OUT*);
  "SHIFT-IN"(*, SHIFT_IN*);
  "SERVICE"(*, SERVICE*);
  "SEMAPHORE-POINTER"(*, SEMAPHORE_POINTER*);
  "SELFCLASS"(*, SELFCLASS*);
  "SELECTIVE"(*, SELECTIVE*);
  "SELECTION"(*, SELECTION*);
  "SEEK"(*, SEEK*);
  "SECONDARY"(*, SECONDARY*);
  "SARF"(*, SARF*);
  "ROWID"(*, ROWID*);
  "ROLLING"(*, ROLLING*);
  "RETURN-UNSIGNED"(*, RETURN_UNSIGNED*);
  "RETURN-CODE"(*, RETURN_CODE*);
  "RETENTION"(*, RETENTION*);
  "RESTRICTED"(*, RESTRICTED*);
  "RESIZABLE"(*, RESIZABLE*);
  "RESIDENT"(*, RESIDENT*);
  "RESET-SET-LOCATOR"(*, RESET_SET_LOCATOR*);
  "REPLACED"(*, REPLACED*);
  "RELOAD"(*, RELOAD*);
  "REDEFINITION"(*, REDEFINITION*);
  "RECORD-POSITION"(*, RECORD_POSITION*);
  "READY"(*, READY*);
  "READING"(*, READING*);
  "RANGE"(*, RANGE*);
  "QUEUED"(*, QUEUED*);
  "PUBLIC"(*, PUBLIC*);
  "PROCESS-AREA"(*, PROCESS_AREA*);
  "PROCESS"(*, PROCESS*);
  "PROCEDURE-NAME"(*, PROCEDURE_NAME*);
  "PRIVATE"(*, PRIVATE*);
  "PRIOR"(*, PRIOR*);
  "PRINT-CONTROL"(*, PRINT_CONTROL*);
  "PRIMARY"(*, PRIMARY*);
  "PREFIXING"(*, PREFIXING*);
  "POSITIONING"(*, POSITIONING*);
  "POINTER-32"(*, POINTER_32*);
  "PANEL-WIDTHS"(*, PANEL_WIDTHS*);
  "PANEL-TEXT"(*, PANEL_TEXT*);
  "PANEL-STYLE"(*, PANEL_STYLE*);
  "PANEL-INDEX"(*, PANEL_INDEX*);
  "PAGE-SIZE"(*, PAGE_SIZE*);
  "O-FILL"(*, O_FILL*);
  "OVERRIDING"(*, OVERRIDING*);
  "OVERLAPPED"(*, OVERLAPPED*);
  "OTHERWISE"(*, OTHERWISE*);
  "OPERATIONAL"(*, OPERATIONAL*);
  "OOSTACKPTR"(*, OOSTACKPTR*);
  "OBJECT-STORAGE"(*, OBJECT_STORAGE*);
  "OBJECT-PROGRAM"(*, OBJECT_PROGRAM*);
  "OBJECT-ID"(*, OBJECT_ID*);
  "NUM-ROW-HEADINGS"(*, NUM_ROW_HEADINGS*);
  "NUMERIC-FILL"(*, NUMERIC_FILL*);
  "NO-TAB"(*, NO_TAB*);
  "NO-CLOSE"(*, NO_CLOSE*);
  "NO-CELL-DRAG"(*, NO_CELL_DRAG*);
  "NOTE"(*, NOTE*);
  "NET-EVENT-LIST"(*, NET_EVENT_LIST*);
  "NCLOB"(*, NCLOB*);
  "NCHAR"(*, NCHAR*);
  "MUTEX-POINTER"(*, MUTEX_POINTER*);
  "MORE-LABELS"(*, MORE_LABELS*);
  "MONITOR-POINTER"(*, MONITOR_POINTER*);
  "MODULE"(*, MODULE*);
  "MODIFIED"(*, MODIFIED*);
  "MODELESS"(*, MODELESS*);
  "MODAL"(*, MODAL*);
  "MIN-WIDTH"(*, MIN_WIDTH*);
  "MIN-VALUE"(*, MIN_VALUE*);
  "MIN-SIZE"(*, MIN_SIZE*);
  "MIN-LINES"(*, MIN_LINES*);
  "MIN-HEIGHT"(*, MIN_HEIGHT*);
  "META-CLASS"(*, META_CLASS*);
  "MESSAGES"(*, MESSAGES*);
  "MDI-FRAME"(*, MDI_FRAME*);
  "MDI-CHILD"(*, MDI_CHILD*);
  "MAX-WIDTH"(*, MAX_WIDTH*);
  "MAX-VALUE"(*, MAX_VALUE*);
  "MAX-SIZE"(*, MAX_SIZE*);
  "MAX-HEIGHT"(*, MAX_HEIGHT*);
  "LOWEST-VALUE"(*, LOWEST_VALUE*);
  "LOW"(*, LOW*);
  "LONG-VARCHAR"(*, LONG_VARCHAR*);
  "LONG-VARBINARY"(*, LONG_VARBINARY*);
  "LOCKS"(*, LOCKS*);
  "LINK"(*, LINK*);
  "LINES-PER-PAGE"(*, LINES_PER_PAGE*);
  "LIN"(*, LIN*);
  "KEY-LOCATION"(*, KEY_LOCATION*);
  "KEYED"(*, KEYED*);
  "KANJI"(*, KANJI*);
  "JSON-STATUS"(*, JSON_STATUS*);
  "JSON-CODE"(*, JSON_CODE*);
  "JOINING"(*, JOINING*);
  "JNIENVPTR"(*, JNIENVPTR*);
  "JAVA"(*, JAVA*);
  "JAPANESE"(*, JAPANESE*);
  "ITEM-ID"(*, ITEM_ID*);
  "ITEM-BOLD"(*, ITEM_BOLD*);
  "INVOKING"(*, INVOKING*);
  "INVOKED"(*, INVOKED*);
  "INTERVAL-TIMER"(*, INTERVAL_TIMER*);
  "INSTANCE"(*, INSTANCE*);
  "INSERT"(*, INSERT*);
  "INITIAL-VALUE"(*, INITIAL_VALUE*);
  "INHERITING"(*, INHERITING*);
  "INDICATORS"(*, INDICATORS*);
  "INDICATOR"(*, INDICATOR*);
  "INDIC"(*, INDIC*);
  "INDEX-2"(*, INDEX_2*);
  "INDEX-1"(*, INDEX_1*);
  "IMP"(*, IMP*);
  "IDS-II"(*, IDS_II*);
  "HORIZONTAL"(*, HORIZONTAL*);
  "HIGHEST-VALUE"(*, HIGHEST_VALUE*);
  "HIGH"(*, HIGH*);
  "HELP-ID"(*, HELP_ID*);
  "HEIGHT"(*, HEIGHT*);
  "GRIP"(*, GRIP*);
  "GCOS"(*, GCOS*);
  "FLR"(*, FLR*);
  "FILE-PREFIX"(*, FILE_PREFIX*);
  "FILE-PATH"(*, FILE_PATH*);
  "FILES"(*, FILES*);
  "FIELD-TERMINATOR"(*, FIELD_TERMINATOR*);
  "EXTERNALLY-DESCRIBED-KEY"(*, EXTERNALLY_DESCRIBED_KEY*);
  "EXECUTE"(*, EXECUTE*);
  "EXEC"(*, EXEC*);
  "EXCLUDE-EVENT-LIST"(*, EXCLUDE_EVENT_LIST*);
  "EXCESS-3"(*, EXCESS_3*);
  "EXCEEDS"(*, EXCEEDS*);
  "EVENT-POINTER"(*, EVENT_POINTER*);
  "END-WAIT"(*, END_WAIT*);
  "END-USE"(*, END_USE*);
  "END-SET"(*, END_SET*);
  "END-REPLACE"(*, END_REPLACE*);
  "END-ON"(*, END_ON*);
  "END-MOVE"(*, END_MOVE*);
  "END-INVOKE"(*, END_INVOKE*);
  "END-EXEC"(*, END_EXEC*);
  "END-ENABLE"(*, END_ENABLE*);
  "END-DISABLE"(*, END_DISABLE*);
  "END-COPY"(*, END_COPY*);
  "ENDING"(*, ENDING*);
  "ENABLED"(*, ENABLED*);
  "EJECT"(*, EJECT*);
  "EGCS"(*, EGCS*);
  "EGC"(*, EGC*);
  "DROP"(*, DROP*);
  "DRAW"(*, DRAW*);
  "DOT-DASH"(*, DOT_DASH*);
  "DISPLAY-ST"(*, DISPLAY_ST*);
  "DISPLAY-4"(*, DISPLAY_4*);
  "DISPLAY-3"(*, DISPLAY_3*);
  "DISPLAY-2"(*, DISPLAY_2*);
  "DISJOINING"(*, DISJOINING*);
  "DISCONNECT"(*, DISCONNECT*);
  "DESCRIPTOR"(*, DESCRIPTOR*);
  "DECLARE"(*, DECLARE*);
  "DEBUG-SUB-3"(*, DEBUG_SUB_3*);
  "DEBUG-SUB-2"(*, DEBUG_SUB_2*);
  "DEBUG-SUB-1"(*, DEBUG_SUB_1*);
  "DEBUG-NAME"(*, DEBUG_NAME*);
  "DEBUG-LINE"(*, DEBUG_LINE*);
  "DEBUG-ITEM"(*, DEBUG_ITEM*);
  "DEBUG-CONTENTS"(*, DEBUG_CONTENTS*);
  "DEBUG"(*, DEBUG*);
  "DBCS"(*, DBCS*);
  "DBCLOB-LOCATOR"(*, DBCLOB_LOCATOR*);
  "DBCLOB-FILE"(*, DBCLOB_FILE*);
  "DBCLOB"(*, DBCLOB*);
  "DAY-AND-TIME"(*, DAY_AND_TIME*);
  "DATE-RECORD"(*, DATE_RECORD*);
  "DATE-AND-TIME"(*, DATE_AND_TIME*);
  "CURRENT-DATE"(*, CURRENT_DATE*);
  "CULTURE"(*, CULTURE*);
  "CS-GENERAL"(*, CS_GENERAL*);
  "CS-BASIC"(*, CS_BASIC*);
  "CSP"(*, CSP*);
  "CREATE"(*, CREATE*);
  "COUNT-TRAILING"(*, COUNT_TRAILING*);
  "COUNT-MIN"(*, COUNT_MIN*);
  "COUNT-MAX"(*, COUNT_MAX*);
  "COUNT-LEADLING"(*, COUNT_LEADLING*);
  "CONVERT"(*, CONVERT*);
  "CONTROL-AREA"(*, CONTROL_AREA*);
  "CONTROLS-UNCROPPED"(*, CONTROLS_UNCROPPED*);
  "CONTENT-OF"(*, CONTENT_OF*);
  "CONSTRUCTOR"(*, CONSTRUCTOR*);
  "CONSOLE-3"(*, CONSOLE_3*);
  "CONSOLE-2"(*, CONSOLE_2*);
  "CONSOLE-1"(*, CONSOLE_1*);
  "CONSOLE-0"(*, CONSOLE_0*);
  "CONNECT"(*, CONNECT*);
  "COM-REG"(*, COM_REG*);
  "COMP-7"(*, COMP_7*);
  "COMP-14"(*, COMP_14*);
  "COMP-13"(*, COMP_13*);
  "COMP-12"(*, COMP_12*);
  "COMP-11"(*, COMP_11*);
  "COMPUTATIONAL-7"(*, COMPUTATIONAL_7*);
  "COMPUTATIONAL-14"(*, COMPUTATIONAL_14*);
  "COMPUTATIONAL-13"(*, COMPUTATIONAL_13*);
  "COMPUTATIONAL-12"(*, COMPUTATIONAL_12*);
  "COMPUTATIONAL-11"(*, COMPUTATIONAL_11*);
  "COMPRESSION"(*, COMPRESSION*);
  "COMPLEMENTARY"(*, COMPLEMENTARY*);
  "COMPLE"(*, COMPLE*);
  "COMMITMENT"(*, COMMITMENT*);
  "COERCION"(*, COERCION*);
  "CLOB-LOCATOR"(*, CLOB_LOCATOR*);
  "CLOB-FILE"(*, CLOB_FILE*);
  "CLOB"(*, CLOB*);
  "CLASS-OBJECT"(*, CLASS_OBJECT*);
  "CLASS-NAME"(*, CLASS_NAME*);
  "CLASS-CONTROL"(*, CLASS_CONTROL*);
  "CICS"(*, CICS*);
  "CHECKPOINT-FILE"(*, CHECKPOINT_FILE*);
  "CHECK"(*, CHECK*);
  "CHAR-VARYING"(*, CHAR_VARYING*);
  "CHART"(*, CHART*);
  "CHAR"(*, CHAR*);
  "CENTURY-DAY"(*, CENTURY_DAY*);
  "CBL"(*, CBL*);
  "CATALOGUE-NAME"(*, CATALOGUE_NAME*);
  "CATALOGUED"(*, CATALOGUED*);
  "CASE-SENSITIVE"(*, CASE_SENSITIVE*);
  "CASE-INSENSITIVE"(*, CASE_INSENSITIVE*);
  "CALLED"(*, CALLED*);
  "B-EXOR"(*, B_EXOR*);
  "BSN"(*, BSN*);
  "BROWSING"(*, BROWSING*);
  "BLOB-LOCATOR"(*, BLOB_LOCATOR*);
  "BLOB-FILE"(*, BLOB_FILE*);
  "BLOB"(*, BLOB*);
  "BITS"(*, BITS*);
  "BITMAP-SCALE"(*, BITMAP_SCALE*);
  "BITMAP-RAW-WIDTH"(*, BITMAP_RAW_WIDTH*);
  "BITMAP-RAW-HEIGHT"(*, BITMAP_RAW_HEIGHT*);
  "BIND"(*, BIND*);
  "BEGINNING"(*, BEGINNING*);
  "BECOMES"(*, BECOMES*);
  "BASIS"(*, BASIS*);
  "AX-EVENT-LIST"(*, AX_EVENT_LIST*);
  "AUTO-RESIZE"(*, AUTO_RESIZE*);
  "AUTO-MINIMIZE"(*, AUTO_MINIMIZE*);
  "AUTO-HYPHEN-SKIP"(*, AUTO_HYPHEN_SKIP*);
  "ASSEMBLY-NAME"(*, ASSEMBLY_NAME*);
  "ASA"(*, ASA*);
  "AREA-VALUES"(*, AREA_VALUES*);
  "ANSI"(*, ANSI*);
  "ALTERING"(*, ALTERING*);
  "ALIAS"(*, ALIAS*);
  "ACQUIRE"(*, ACQUIRE*);
  "ABSTRACT"(*, ABSTRACT*);
]

