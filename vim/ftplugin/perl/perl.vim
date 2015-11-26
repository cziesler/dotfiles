" http://www.perlmonks.org/?node_id=540167
let perl_include_pod=1
let perl_extended_vars=1

" Perltidy
nnoremap <silent> <leader>t :%!perltidy -q<Enter>
vnoremap <silent> <leader>t :!perltidy -q<Enter>

nnoremap <leader>l <ESC>gg<ESC>dd<ESC>i#!<ESC>:r!which perl<CR>kA<DEL><ESC>A<ENTER><ESC>
nnoremap <leader>p :!%<CR>

" Perldoc
setlocal keywordprg=perldoc\ -T\ -f

if has('perl')
  " http://blogs.perl.org/users/ovid/2011/01/show-perl-subname-in-vim-statusline.html
  perl << EOP
    use strict;
    sub current_sub {
      my $curwin = $main::curwin;
      my $curbuf = $main::curbuf;

      my @document = map { $curbuf->Get($_) } 0 .. $curbuf->Count;
      my ( $line_number, $column ) = $curwin->Cursor;

      my $sub_name = '(n/a)';
      for my $i ( reverse ( 1 .. $line_number  -1 ) ) {
        my $line = $document[$i];
        if ( $line =~ /^\s*sub\s+(\w+)\b/ ) {
          $sub_name = "$1()";
          last;
        } elsif ( $line =~ /^\s*sub\s+\(.*\)\s+(\w+)\b/ ) {
          $sub_name = "$1()";
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
