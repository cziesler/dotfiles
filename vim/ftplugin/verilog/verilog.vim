" Vim filetype plugin file
" Language:     Verilog
" Adapted From: Chih-Tsun Huang <cthuang@larc.ee.nthu.edu.tw>
" URL:          http://larc.ee.nthu.edu.tw/~cthuang/vim/ftplugin/verilog.vim

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

" Don't load another plugin for this buffer
let b:did_ftplugin = 1

" Undo the plugin effect
let b:undo_ftplugin = "setlocal fo< com< tw<"
    \ . "| unlet! b:browsefilter b:match_ignorecase b:match_words"

" Set 'formatoptions' to break comment lines but not other lines,
" and insert the comment leader when hitting <CR> or using "o".
setlocal fo-=t fo+=croqlm1

" Set 'comments' to format dashed lists in comments.
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://

" Format comments to be up to 80 characters long
if &textwidth == 0
  setlocal tw=80
endif

setlocal cpo-=C

" Indentations
setlocal cindent

" Win32 can filter files in the browse dialog
if has("gui_win32") && !exists("b:browsefilter")
  let b:browsefilter = "Verilog Source Files (*.v)\t*.v\n" .
    \ "All Files (*.*)\t*.*\n"
endif

" Let the matchit plugin know what items can be matched.
if exists("loaded_matchit")
  let b:match_ignorecase=0
  let b:match_words=
    \ '\<begin\>:\<end\>,' .
    \ '\<case\>\|\<casex\>\|\<casez\>:\<endcase\>,' .
    \ '\<module\>:\<endmodule\>,' .
    \ '\<if\>:\<else\>,' .
    \ '\<function\>:\<endfunction\>,' .
    \ '`ifdef\>:`else\>:`endif\>,' .
    \ '`ifndef\>:`else\>:`endif\>,' .
    \ '\<task\>:\<endtask\>,' .
    \ '\<specify\>:\<endspecify\>'
endif

" http://blogs.perl.org/users/ovid/2011/01/ ...
"   show-perl-subname-in-vim-statusline.html
if has('perl')

perl << EOP
  use strict;
  sub current_sub {
    my $curwin = $main::curwin;
    my $curbuf = $main::curbuf;

    my @document = map { $curbuf->Get($_) } 0 .. $curbuf->Count;
    my ( $line_number, $column  ) = $curwin->Cursor;

    my $sub_name = '(n/a)';
    for my $i ( reverse ( 1 .. $line_number  -1 ) ) {
      my $line = $document[$i];
      #if ( $line =~ /^\s*sub\s+(\w+)\b/ ) {
      if ( $line =~ /^\s*module\s+(\w+)\b/ ) {
        $sub_name = $1;
        last;
      } elsif ($line =~ /^\s*module\s+#\(.*\)(\w+)\b/) {
        $sub_name = $1;
        last;
      }
    }
    VIM::DoCommand "let subName='$sub_name'";
  }
EOP

  function! CurrSubName()
    perl current_sub()
    return subName
  endfunction

endif

if exists('loaded_matchit')
  let b:match_ignorecase=0
  let b:match_words=
    \ '\<begin\>:\<end\>,' .
    \ '\<if\>:\<else\>,' .
    \ '\<module\>:\<endmodule\>,' .
    \ '\<class\>:\<endclass\>,' .
    \ '\<program\>:\<endprogram\>,' .
    \ '\<clocking\>:\<endclocking\>,' .
    \ '\<property\>:\<endproperty\>,' .
    \ '\<sequence\>:\<endsequence\>,' .
    \ '\<package\>:\<endpackage\>,' .
    \ '\<covergroup\>:\<endgroup\>,' .
    \ '\<primitive\>:\<endprimitive\>,' .
    \ '\<specify\>:\<endspecify\>,' .
    \ '\<generate\>:\<endgenerate\>,' .
    \ '\<interface\>:\<endinterface\>,' .
    \ '\<function\>:\<endfunction\>,' .
    \ '\<task\>:\<endtask\>,' .
    \ '\<case\>\|\<casex\>\|\<casez\>:\<endcase\>,' .
    \ '\<fork\>:\<join\>\|\<join_any\>\|\<join_none\>,' .
    \ '`ifdef\>:`else\>:`endif\>,'
endif

