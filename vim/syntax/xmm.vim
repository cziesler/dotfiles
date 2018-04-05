"----------------------------------------------------------------------------/
" Vim syntax file
" Language:         xmm files
" Maintainer:       Cody Cziesler
" Latest Revision:  27 May 2017
"----------------------------------------------------------------------------/

if exists("b:current_syntax")
  finish
endif

syn match comment "//.*$"

let b:current_syntax = "xmm"
hi def link comment       Comment
