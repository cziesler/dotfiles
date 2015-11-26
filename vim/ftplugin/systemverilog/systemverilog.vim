" http://blogs.perl.org/users/ovid/2011/01/show-perl-subname-in-vim-statusline.html
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
