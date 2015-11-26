set makeprg=$CDS_WORKAREA/full_chip/verif/runs/run.pl\ -chk_only\ -def_file=%

noremap <leader>p :make!<CR>

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
      if ( $line =~ /^(\w+)\s*:\s*(\w+)\b/ ) {
        $sub_name = "$1:$2";
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
