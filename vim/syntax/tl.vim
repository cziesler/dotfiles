" Vim syntax file
" Language:         testlist
" Maintainer:       Cody Cziesler

syntax keyword todo           contained TODO FIXME
syntax match   question       contained "???"

syntax match   comment        "//.*" contains=todo,question,@Spell

syntax region  string         oneline start=+"+ skip=+\\\\\|\\"+ end=+"+

syntax match   env_var        "\$[a-zA-Z_][a-zA-Z0-9_]*"

if !exists("did_syntax_inits")
  let did_syntax_inits = 1

  highlight link comment         Comment
  highlight link todo            Todo
  highlight link question        Todo
  highlight link string          String

  highlight link env_var         Identifier
endif

hi Todo gui=bold,italic cterm=bold,italic
let b:current_syntax = "tl"
