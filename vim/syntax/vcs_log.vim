""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim syntax file
" Language:         VCS Log File
" Maintainer:       Cody Cziesler
" Latest Revision:  20 Aug 2012
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax keyword   vcs_error     ERROR

syntax match     vcs_comment   "\t.*$"
syntax match     vcs_comment   "//.*$"
syntax match     vcs_comment   "ATMEL.*$"
syntax match     vcs_cmd       "^:.*$"
syntax match     vcs_cpu_cmd   "^\[.*$"
syntax match     vcs_proc_log  "^CPU_LOGR.*$"
syntax match     vcs_xact_log  "^.*xactor.*$"
syntax match     vcs_dbg_log   "cmd -> \[.*"
syntax match     vcs_ti2c_log  "TCH_I2C. : .*"
syntax match     vcs_tt_log    "^.*\[tt_tb.*"

syntax match     vcs_time_elap "^\*\*\*\*\*\*\*\*\*\*\*\*\*\*\* .*$"

syntax match     vcs_cfg_pins  "^cfg_pins.*$"
syntax match     vcs_cfg_pins  "^reset_n.*$"

syntax keyword   vcs_dsi_cmp   COMPARE

highlight link   vcs_comment   Comment
highlight link   vcs_cmd       String
highlight link   vcs_cpu_cmd   String
highlight link   vcs_xact_log  String
highlight link   vcs_dbg_log   String
highlight link   vcs_ti2c_log  String
highlight link   vcs_tt_log    String
highlight link   vcs_proc_log  Keyword
highlight link   vcs_cfg_pins  Define
highlight link   vcs_error     Error
highlight link   vcs_dsi_cmp   Keyword
highlight link   vcs_time_elap Constant

let b:current_syntax = "vcs_log"
