syntax clear

runtime! syntax/c.vim
unlet b:current_syntax

syn keyword cppStatement    new delete this friend using
syn keyword cppAccess       public protected private
syn keyword cppType     inline virtual explicit export bool wchar_t
syn keyword cppExceptions   throw try catch
syn keyword cppOperator     operator typeid
syn keyword cppOperator     and bitor or xor compl bitand and_eq or_eq xor_eq not not_eq
syn match cppCast       "\<\(const\|static\|dynamic\|reinterpret\)_cast\s*<"me=e-1
syn match cppCast       "\<\(const\|static\|dynamic\|reinterpret\)_cast\s*$"
syn keyword cppStorageClass mutable
syn keyword cppStructure    class namespace
syn keyword cppBoolean      true false
syn keyword cppConstant     __cplusplus

if !exists("cpp_no_cpp11")
  syn keyword cppType       override final
  syn keyword cppExceptions noexcept
  syn keyword cppStorageClass   constexpr thread_local
  syn keyword cppConstant   ATOMIC_FLAG_INIT ATOMIC_VAR_INIT
  syn keyword cppConstant   ATOMIC_BOOL_LOCK_FREE ATOMIC_CHAR_LOCK_FREE
  syn keyword cppConstant   ATOMIC_CHAR16_T_LOCK_FREE ATOMIC_CHAR32_T_LOCK_FREE
  syn keyword cppConstant   ATOMIC_WCHAR_T_LOCK_FREE ATOMIC_SHORT_LOCK_FREE
  syn keyword cppConstant   ATOMIC_INT_LOCK_FREE ATOMIC_LONG_LOCK_FREE
  syn keyword cppConstant   ATOMIC_LLONG_LOCK_FREE ATOMIC_POINTER_LOCK_FREE
  syn region cppRawString   matchgroup=cppRawDelimiter start=+\%(u8\|[uLU]\)\=R"\z([[:alnum:]_{}[\]#<>%:;.?*\+\-/\^&|~!=,"']\{,16}\)(+ end=+)\z1"+ contains=@Spell
endif

syn match cppMinMax "[<>]?"

if version >= 508 || !exists("did_cpp_syntax_inits")
  if version < 508
    let did_cpp_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink cppAccess      cppStatement
  HiLink cppCast        cppStatement
  HiLink cppExceptions      Exception
  HiLink cppOperator        Operator
  HiLink cppStatement       Statement
  HiLink cppType        Type
  HiLink cppStorageClass    StorageClass
  HiLink cppStructure       Structure
  HiLink cppBoolean     Boolean
  HiLink cppConstant        Constant
  HiLink cppRawDelimiter    Delimiter
  HiLink cppRawString       String
  delcommand HiLink
endif

let b:current_syntax = "cpp"

syntax match Operator "\.\.\." conceal cchar=…
syntax match cppStructure "typename" conceal
syntax match cppStructure "typename " conceal
syntax match cppStructure "<typename>" conceal cchar=𝐓
syntax match cppStructure "template" conceal
syntax match cppConstant "nullptr" conceal cchar=∅
syntax match Operator "==" conceal cchar=≡
syntax match Operator "!=" conceal cchar=≢
syntax match Operator "<=" conceal cchar=≤
syntax match Operator ">=" conceal cchar=≥
syntax match cppStatement "\S*sqrt" conceal cchar=√
syntax match cppStatement "std::" conceal
syntax match cppStatement "std::move" conceal cchar=↑
syntax match cppStatement "std::swap" conceal cchar=⇿
syntax match cppStatement "std::all_of" conceal cchar=∀
syntax match cppStatement "std::any_of" conceal cchar=∃
syntax match cppStatement "std::none_of" conceal cchar=∄
hi! link Conceal Operator
