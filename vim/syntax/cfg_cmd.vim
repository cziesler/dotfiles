"----------------------------------------------------------------------------/
" Vim syntax file
" Language:         cfg_cmd files
" Maintainer:       Cody Cziesler
" Latest Revision:  14 Aug 2012
"----------------------------------------------------------------------------/

if exists("b:current_syntax")
  finish
endif

syn keyword cfg_cmdTodo containedin=cfg_cmdComment contained TODO FIXME XXX NOTE
syn match   cfg_cmdComment "//.*$" contains=cfg_cmdTodo

"----------------------------------------------------------------------------/
"   Numbers
"----------------------------------------------------------------------------/
"  Hexadecimal Number
syn match   cfg_cmdNumber /\<[0-9a-fA-F_]\+\>/ " Hex numbers

"----------------------------------------------------------------------------/
"  Strings
"----------------------------------------------------------------------------/
syn match   cfg_cmdCopyfile "//\#.*$"
syn match   cfg_cmdGlobal   "`[a-zA-Z0-9_]\+\>"

syn match   cfg_cmdCfgpins  /^\<[A-Z0-9_]\+\>/

"----------------------------------------------------------------------------/
"  Keywords
"----------------------------------------------------------------------------/
syn keyword cfg_cmdKeyword  OP OPC OPR OPW OPRF OPWF WR WR_SYNC RD RD_SYNC
syn keyword cfg_cmdKeyword  DBW DBR OP2 OP4 OPW_LP WRLP WRRD POLL
syn keyword cfg_cmdKeyword  W_SYNC1 SYNC1 EXT_CLK_OFF WC WK WV WH WVXFR WCE
syn keyword cfg_cmdKeyword  WKE WUS WNS WMS
syn keyword cfg_cmdKeyword  MEM_WR24 MEM_WR18 MEM_WR16 MEM_RD MEM_RD1
syn keyword cfg_cmdKeyword  SYNC_A SYNC_B SYNC_C HTM_EN HTM_WR HTM_WR_FULL
syn keyword cfg_cmdKeyword  HTM_RD_FULL HTM_RD
syn keyword cfg_cmdKeyword  VPP CHK_GDRV
syn keyword cfg_cmdKeyword  OVL_MEM_RD
syn keyword cfg_cmdKeyword  SIMCTL_WR SIMCTL_POLL
syn keyword cfg_cmdKeyword  VID_EN GEN_VID
syn keyword cfg_cmdKeyword  SMRPS WRSRD RMW

"----------------------------------------------------------------------------/
"  Setup syntax highlighting
"----------------------------------------------------------------------------/
let b:current_syntax = "cfg_cmd"
hi def link cfg_cmdTodo          Todo
hi def link cfg_cmdComment       Comment
hi def link cfg_cmdCopyfile      Statement
hi def link cfg_cmdKeyword       Keyword
hi def link cfg_cmdCfgpins       Identifier
hi def link cfg_cmdNumber        Constant
hi def link cfg_cmdGlobal        String
