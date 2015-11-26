"----------------------------------------------------------------------------/
" Vim syntax file
" Language:         summary*.log
" Maintainer:       Cody Cziesler
" Latest Revision:  16 Aug 2012
"----------------------------------------------------------------------------/

if exists("b:current_syntax")
  finish
endif

syn match   sum_Fail    "FAIL"
syn match   sum_Fail    "ERROR"
syn match   sum_Pass    "PASS"
syn match   sum_Comment "#.*"
syn match   sum_Comment "=.*"
syn match   sum_Comment ":"
syn match   sum_Comment "                 Regression Started.*"
syn match   sum_Comment "                 ------------------.*"
syn match   sum_Comment "                 (run.pl.*"

"----------------------------------------------------------------------------/
"   Numbers
"----------------------------------------------------------------------------/
syn match   sum_Time   /([0-9 ]\{4})/

syn match   sum_NumFail /[1-9][0-9]*/
syn match   sum_NumPass /0/

"----------------------------------------------------------------------------/
"  Keywords
"----------------------------------------------------------------------------/
syn match   sum_TestName  " [A-Za-z][A-Za-z0-9_]\+"

syn keyword sum_Keyword   Status Testname Errors Viols Time Outs No
syn keyword sum_Keyword   Msg PP Pass Fail Not
syn match   sum_Keyword   "(secs)"


"----------------------------------------------------------------------------/
"  Setup syntax highlighting
"----------------------------------------------------------------------------/
let b:current_syntax = "summary"
hi def link sum_Comment       Comment
hi def link sum_Pass          Statement
hi def link sum_Keyword       Keyword
hi def link sum_Time          Keyword
hi def link sum_TestName      String
hi def link sum_Fail          Error
hi def link sum_NumFail       Number
hi def link sum_NumPass       Keyword
