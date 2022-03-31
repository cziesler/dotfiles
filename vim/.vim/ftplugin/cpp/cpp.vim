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
      if ( $line =~ /^(\b[a-zA-Z0-9_]+\b\s*)*(\w+)\b.*\{/ ) {
        $sub_name = $2;
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
