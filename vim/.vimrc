"-------------------------------------------------------------------------------
" Filename: .vimrc
" Author:   Cody Cziesler
"
" https://github.com/tpope/vim-pathogen
" https://github.com/vim-scripts/Mark--Karkat
" https://github.com/junegunn/vim-easy-align
" https://github.com/mhinz/vim-signify
"-------------------------------------------------------------------------------

" To allow for unicode
scriptencoding utf-8

"-------------------------------------------------------------------------------
" Leader key (comma)
"-------------------------------------------------------------------------------
let mapleader=","              " remap the leader key

"-------------------------------------------------------------------------------
" Pathogen
"-------------------------------------------------------------------------------
let g:pathogen_disabled = []   " disabled bundles
silent! call pathogen#infect() " infect! oh no!

" signify
let g:signify_vcs_cmds = {
  \ 'sos'  : '$HOME/scripts/sosdiff %f',
  \ 'git'  : 'git diff --no-color --no-ext-diff -U0 -- %f',
  \ 'svn'  : 'svn diff --diff-cmd %d -x "-U0 --ignore-all-space" -- %f',
  \ }
let g:signify_vcs_cmds_diffmode = {
  \ 'sos'  : '$HOME/scripts/sosdiff %f',
  \ }

"-------------------------------------------------------------------------------
" Basic Stuff
"-------------------------------------------------------------------------------
set visualbell        " remove the annoying beep
set noerrorbells      " no error bells

"-------------------------------------------------------------------------------
" GUI Stuff
"-------------------------------------------------------------------------------
if has("gui_running")
  set guioptions-=T   " Remove the toolbar in the GUI
  set guioptions-=m   " Remove the menu bar
  set guioptions-=l   " Remove the left-handed scrollbar
  set guioptions-=L   " Remove left scrollbar
  set guioptions+=r   " Keep right scrollbar
  set guioptions+=c   " Use console dialogs

  " Set width/height
  set lines=50 columns=100

  " Find a font that works
  for i in ['Pointfree\ 8', 'Pointfree:h8', 'Menlo\ Regular:h8', 'Monospace:h8']
    silent! execute 'set guifont=' . i
    let i = substitute(i, "\\", "", "g")
    if &guifont == i
      break
    endif
  endfor

  silent! colorscheme dracula
else
  if exists('+termguicolors')
    set termguicolors
    set t_Co=256
    let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
    let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"

    silent! colorscheme dracula
  else
    set t_Co=256

    silent! colorscheme dracula
  endif
endif

"-------------------------------------------------------------------------------
" Display Stuff
"-------------------------------------------------------------------------------
set wildmenu                   " Visual autocomplete for command menu
set wildmode=list:longest,full " First list all options, then go through them.
set scrolloff=3                " Keep 3 lines when scrolling
set sidescrolloff=3            " Keep 3 columns when side scrolling
set nostartofline              " Don't jump to the start of line when paging
set showcmd                    " In select mode, show number of lines/chars/etc
set showbreak=↳\               " Add '↳ ' at linewraped lines

set tabpagemax=500             " allow up to 100 tabs to open from command line

set list                       " Enable list characters
set listchars=tab:→\ ,trail:…,extends:>,precedes:<
nmap <leader>l :setlocal list!<CR>

set lazyredraw                 " don't redraw when executing commands
set ttyfast                    " improve redrawing smoothness

syntax enable                  " Enable syntax

set shortmess+=I               " Disable Uganda message
set report=0                   " Always display number of lines changes by cmd

set virtualedit+=block         " allow visual block cursor to move anywhere

set nowrap                     " no wrap by default
nnoremap <leader>w :set wrap!<CR>

"-------------------------------------------------------------------------------
" Tab Stuff
"-------------------------------------------------------------------------------
set expandtab                 " insert spaces when tab is pressed
set softtabstop=2             " number of spaces that a <tab> counts for
set tabstop=2                 " width of <tab> character
set shiftwidth=2              " number of spaces to use for each step of indent
set shiftround                " >, < limited to multiples of shiftwidth

"-------------------------------------------------------------------------------
" Searching Stuff
"-------------------------------------------------------------------------------
set incsearch                 " enable incremental search
set hlsearch                  " enable highlight search
set showmatch                 " flash opposite bracket on insertion

"set ignorecase                " ignore cases when searching
"set smartcase                 " unless asked for

set nojoinspaces              " one space between periods

"-------------------------------------------------------------------------------
" Automagically change the current directory
"-------------------------------------------------------------------------------
set autochdir                 " automagically change the cwd to dir of file

"-------------------------------------------------------------------------------
" Disable X clipboard
"-------------------------------------------------------------------------------
set clipboard=exclude:.*      " disable clipboard on all terminals

"-------------------------------------------------------------------------------
" Backup Stuff
"-------------------------------------------------------------------------------
set backup                    " enable backups
set backupdir=~/.vimlocal/backup// " backup directory

if !isdirectory($HOME . '/.vimlocal/backup')
  call mkdir($HOME . '/.vimlocal/backup', 'p')
endif

if has("+persistent_undo")
  set undofile                " use undo file
  set undodir=~/.vimlocal/undo//   " undo directory
  if !isdirectory($HOME . '/.vimlocal/undo')
    call mkdir($HOME . '/.vimlocal/undo', 'p')
  endif
endif

set directory=~/.vimlocal/swp//
if !isdirectory($HOME . '/.vimlocal/swp')
  call mkdir($HOME . '/.vimlocal/swp', 'p')
endif

" Disable netrwhist
let g:netrw_dirhistmax = 0

"-------------------------------------------------------------------------------
" Enable indent files
"-------------------------------------------------------------------------------
set smartindent               " smart indent when adding a new line
set cindent                   " enable automatic C-type program indenting
set cinkeys+=:                " keys for auto-intending

if has("autocmd")
  filetype plugin indent on   " enable filetype plugins and indents
endif

"-------------------------------------------------------------------------------
" Spelling
"-------------------------------------------------------------------------------
if has("spell")
  set nospell                 " disable spelling by default
  set spelllang=en_us         " set the language
  nnoremap <leader>ss :setlocal spell!<CR>
end

"-------------------------------------------------------------------------------
" Backspace
"-------------------------------------------------------------------------------
set backspace=indent,eol,start " allow backspace over indent, eol, and start of insert

"-------------------------------------------------------------------------------
" Diff Options
"-------------------------------------------------------------------------------
set diffopt+=iwhite           " Ignore whitespace changes

"-------------------------------------------------------------------------------
" File encoding
"-------------------------------------------------------------------------------
set fileencodings=ucs-bom,utf-8,sjis,default

"-------------------------------------------------------------------------------
" Remaps
"-------------------------------------------------------------------------------

" Keep search pattern in center of the screen
nmap n  nzz
nmap N  Nzz
if !(&runtimepath =~ 'Mark--Karkat')
  nmap * *zz
  nmap # #zz
endif

" <F8> - remove highlighting
function! RemoveHL()
  if &runtimepath =~ 'Mark--Karkat'
    call mark#ClearAll()
  endif
endfunction
map <F8> :call RemoveHL()<CR>:nohlsearch<CR>

" Edit/Source my ~/.vimrc
nnoremap <leader>ev :tabnew $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" SOS Checkout/Checkin files
"   Now using sos plugin
"if executable("soscmd")
"  nnoremap <leader>co :!soscmd co %<CR>
"  nnoremap <leader>ci :!soscmd ci %<CR>
"  nnoremap <leader>d  :!soscmd diff -gui %<CR>
"  nnoremap <leader>s  :!soscmd status %<CR>
"endif

" Header
if !empty(glob("$HOME/scripts/add_header.pl"))
  nnoremap <leader>h  :!$HOME/scripts/add_header.pl %<CR>
endif

" Directory explorer
nnoremap <leader>e  :Vexplore!<CR>

" qq to record, Q to replay
nmap Q @q

" CTRL-n CTRL-n - toggle line numbers
set number
nmap <C-n><C-n> :setlocal number!<CR>

" <F5> - view colors
if !empty(glob("$VIMRUNTIME/syntax/hitest.vim"))
  map <F5>  :source $VIMRUNTIME/syntax/hitest.vim<CR>
endif

" <F10> - launch terminal
if executable("konsole")
  map <F10> :silent !konsole &<CR>:redraw<CR>
endif

" <F11> - highlight lines longer than 80 characters
map <F11> /.\{81,\}<CR>

" <F12> - remove trailing whitespace
"   http://vimcasts.org/episodes/tidying-whitespace
function! <SID>StripTrailingWhitespaces()
  " save last search, and cursor position.
  let _s=@\
  let l = line(".")
  let c = col(".")
  " do the business
  %s/\s\+$//e
  " restore previous search history, and cursor position
  let @/=_s
  call cursor(l,c)
endfunction
nnoremap <silent> <F12> :call <SID>StripTrailingWhitespaces()<CR>

" <F6> - toggle color scheme to a light version for copying
function! ToggleColorScheme()
  if (GetColorsName() =~ "github")
    colorscheme nord
  else
    colorscheme github-old
  endif
endfunc
map <silent> <F6> :call ToggleColorScheme()<CR>

"-------------------------------------------------------------------------------
" Status bar
"-------------------------------------------------------------------------------

" Get the highlight group under the cursor
function! SyntaxItem()
  return synIDattr(synID(line("."),col("."),1),"name")
endfunction

" Return the current color scheme
function! GetColorsName()
  return get(g:, 'colors_name', 'n/a')
endfunction

" Get the last modify date for the current file
function! GetFileModifyTime()
  let msg = strftime("%m/%d/%Y %H:%M:%S",
    \ getftime(tolower(expand('%<')).'.'.tolower(expand("%:e"))))
  return msg
endfunction

" Can be overridden by autocmd's
function! CurrSubName()
  return ""
endfunction

" This function is called every time the colorscheme changes
"   http://stackoverflow.com/questions/5375240/a-more-useful-statusline-in-vim
function! PostColorscheme()
  " Colors
  highlight User1 guifg=#000000 guibg=#808080 ctermfg=16 ctermbg=12
  highlight User2 guifg=#000000 guibg=#7fb2e5 ctermfg=16 ctermbg=12
  highlight User3 guifg=#000000 guibg=#7aa6c7 ctermfg=16 ctermbg=12
  highlight User4 guifg=#000000 guibg=#7fb2e5 ctermfg=16 ctermbg=12
  highlight User5 guifg=#000000 guibg=#5a90b9 ctermfg=16 ctermbg=12
  highlight User6 guifg=#000000 guibg=#7e8aa2 ctermfg=16 ctermbg=12
  highlight User7 guifg=#000000 guibg=#7b9c9c ctermfg=16 ctermbg=12
  highlight User8 guifg=#000000 guibg=#89ba63 ctermfg=16 ctermbg=12
  highlight User9 guifg=#000000 guibg=#5b8484 ctermfg=16 ctermbg=12
  highlight User0 guifg=#000000 guibg=#7b9c9c ctermfg=16 ctermbg=12

  highlight Search1 guibg=#FF0000
  highlight Search2 guibg=#FF7700
  highlight Search3 guibg=#FFFF00
  highlight Search4 guibg=#00FF00
  highlight Search5 guibg=#0000FF
  highlight Search6 guibg=#4B0082
  highlight Search7 guibg=#8F00FF

  " Highlights (do this after loading colors)
  highlight clear    SpellBad
  highlight SpellBad gui=undercurl guisp=red cterm=underline
  highlight Search   guibg=Yellow  guifg=Black ctermfg=Black ctermbg=Yellow
  highlight Comment  gui=italic

  " Status line
  set laststatus=2                              " always use a status line
  set statusline =%1*\ %t\                      " filename
  set statusline+=%4*\ %{CurrSubName()}\        " current sub/function
  set statusline+=%2*\ %y\                      " filetype
  set statusline+=%6*\ %h%m%r%w%=\              " read/write status, separator
  set statusline+=%6*\ %{SyntaxItem()}\         " current syntax item
  set statusline+=%7*\ 0x%B\                    " hex value of char
  set statusline+=%8*\ Col:%v\                  " column
  set statusline+=%9*\ Row:%l/%L\               " row
  set statusline+=%3*\ %{GetColorsName()}\      " color scheme
  set statusline+=%5*\ %{GetFileModifyTime()}\  " modify time
endfunction
call PostColorscheme() " setup the status line

" Automatically re-set up the status line w/ colors when
" the colorscheme is changed.
if has("autocmd")
  autocmd ColorScheme * call PostColorscheme()
endif

"-------------------------------------------------------------------------------
" Abbreviations
"-------------------------------------------------------------------------------
iabbrev <expr> (date) strftime("%c")

"-------------------------------------------------------------------------------
" Check for local vimrc
"-------------------------------------------------------------------------------
let b:thisdir=expand("%:p:h")
let b:vim=b:thisdir."/.vim.custom"
if filereadable(b:vim)
  echo "Sourcing ".b:vim
  execute "source ".b:vim
endif
