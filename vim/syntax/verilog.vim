" Vim syntax file
" Language:         Verilog
" Maintainer:       Cody Cziesler
" Latest Revision:  09 Aug 2012

"syntax clear

syntax keyword verilogKeyword        disable assign deassign force release
syntax keyword verilogKeyword        always initial endmodule
syntax keyword verilogKeyword        function endfunction
syntax keyword verilogKeyword        task endtask
syntax keyword verilogKeyword        posedge negedge wait
syntax keyword verilogKeyword        buf pullup pull0 pull1 pulldown
syntax keyword verilogKeyword        tri0 tri1 tri trireg
syntax keyword verilogKeyword        wand wor triand trior
syntax keyword verilogKeyword        defparam
syntax keyword verilogKeyword        begin end
syntax keyword verilogKeyword        if else case casex casez default endcase
syntax keyword verilogKeyword        forever repeat while for

syntax keyword verilogStorageClass   input output inout reg wire
syntax keyword verilogStorageClass   integer real parameter event
syntax keyword verilogStorageClass   int logic bit byte time

syntax region  verilogString         oneline start=+"+  skip=+\\\\\|\\"+  end=+"+

syntax keyword verilogTodo           contained TODO FIXME
syntax match   verilogQuestion       contained "???"

syntax region  verilogComment        start="/\*"  end="\*/" contains=verilogTodo,verilogQuestion,@Spell
syntax match   verilogComment        "//.*" contains=verilogTodo,verilogQuestion,@Spell

syntax keyword verilogKeyword        contained module
syntax match   verilogModName        contained "[a-zA-Z-_][a-zA-Z_0-9]*"
syntax match   verilogModLine        transparent "^[ \t]*module[ \t]\+[a-zA-Z-_][a-zA-Z_0-9]*\>" contains=verilogKeyword,verilogModName

syntax match   verilogGlobal         "`[a-zA-Z0-9_]\+\>"
syntax match   verilogConstant       "\<[A-Z0-9_]\+\>"

syntax match   verilogNumber         /\<[0-9]\+\>/
syntax match   verilogNumber         /\<[0-9]\+\>\'\<[0-9a-fA-F_bdhozx]\+\>/

syntax match   verilogIncluded       contained +"[^"]*"+
syntax match   verilogIncluded       contained "<[^>]*>"
syntax match   verilogInclude        "^`include\>[ \t]*["<]" contains=verilogIncluded

syntax match   verilogCPP            contained "^`define\>"
syntax match   verilogDefined        contained "[a-zA-Z0-9_]\+"
syntax match   verilogDefine         "^`define\>[ \t]\+[a-zA-Z0-9_]\+" contains=verilogCPP,verilogDefined

syntax match   verilogMethod         "\$\<[a-z]\+\>"

syntax match   verilogDelay          "#\w\+"
syntax match   verilogDelay          "#[ ]*(.\{-})"

syntax sync lines=1000

if !exists("did_verilog_syntax_inits")
  let did_verilog_syntax_inits = 1

  highlight link verilogCPP             Define
  highlight link verilogComment         Comment
  highlight link verilogConstant        Constant
  highlight link verilogDefine          Define
  highlight link verilogDefined         Define
  highlight link verilogDelay           Typedef
  highlight link verilogGlobal          Define
  highlight link verilogInclude         Include
  highlight link verilogIncluded        String
  highlight link verilogKeyword         Keyword
  highlight link verilogMethod          Define
  highlight link verilogModName         Function
  highlight link verilogNumber          Number
  highlight link verilogStorageClass    StorageClass
  highlight link verilogString          String
  highlight link verilogTodo            Todo
  highlight link verilogQuestion        Todo
endif

hi Todo gui=bold,italic cterm=bold,italic

let b:current_syntax = "verilog"
