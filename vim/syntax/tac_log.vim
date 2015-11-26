"----------------------------------------------------------------------------/
" Vim syntax file
" Language:         TAC Log Files
" Maintainer:       Cody Cziesler
" Latest Revision:  2013-06-12
"----------------------------------------------------------------------------/

if exists("b:current_syntax")
  finish
endif

syn match   tac_log_statement "@.*$"

syn match   tac_log_cr "@.*CR:.*$"
syn match   tac_log_bfm_statement    "@.*BFM:.*$"
syn match   tac_log_xactor_statement "@.*XACTOR:.*$"
syn match   tac_log_tb_statement     "@.*TB:.*$"

syn match   tac_log_vcs "VCD+ Writer.*$"
syn match   tac_log_timescale "TimeScale.*$"

syn match   tac_log_error ".*ERROR.*$"
syn match   tac_log_error ".*Offending.*$"
syn match   tac_log_error ".*\"tac_bfm.*$"


syn match   tac_comment "//.*$"

"----------------------------------------------------------------------------/
"  Setup syntax highlighting
"----------------------------------------------------------------------------/
let b:current_syntax = "tac_log"

hi tac_log_bfm_statement     guifg='#de935f'
hi tac_log_xactor_statement  guifg='#81a2be'
hi tac_log_tb_statement      guifg='#ac3d91'
hi tac_log_vcs               guifg='#b294bb'
hi tac_log_timescale         guifg='#b294bb'
hi tac_log_error             guifg='#cc6666'
hi tac_log_cr                guifg='#0f6c06'

hi tac_comment               guifg='#666666'
