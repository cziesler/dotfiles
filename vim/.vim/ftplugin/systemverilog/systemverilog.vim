" Vim filetype plugin file
" Language:     SystemVerilog
" Maintainer:   Cody Cziesler

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

" Set 'formatoptions' to break comment lines but not other lines,
" and insert the comment leader when hitting <CR> or using "o".
setlocal fo-=t fo+=croqlm1

" Set 'comments' to format dashed lists in comments.
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://

" Format comments to be up to 80 characters long
if &textwidth == 0
  setlocal tw=80
endif

" Do not concatenate sourced lines that start with a backslash
setlocal cpo-=C

" Indentations
setlocal cindent

" SystemVerilog Tagbar Support
"   (https://github.com/majutsushi/tagbar/wiki)
if exists(':TagbarToggle')
  let g:tagbar_type_systemverilog= {
      \ 'ctagstype' : 'systemverilog',
      \ 'kinds'     : [
          \'c:classes',
          \'t:tasks',
          \'f:functions',
          \'m:modules',
          \'i:interfaces',
          \'v:variables',
          \'d:defines',
          \'e:typedefs',
          \'a:parameters'
    \]
  \}
endif

" Matchit support
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

