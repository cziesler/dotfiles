""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author:
"   Cody Cziesler
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Source pathogen first
execute pathogen#infect()

" Set how many lines of history for VIM to remember
set history=700

" Enable filetype plugins
filetype plugin indent on

" Set autoread when a file is changed outside of VIM
set autoread

" Turn persistent undo on
try
  set undodir=~/.vim/temp_dirs/undodir
  set undofile
catch
endtry

" Necesary for lots of cool vim things
set nocompatible

" This shows what you are typing as a command
set showcmd

" Cool tab completion stuff
set wildmenu
set wildmode=list:longest,full

" Omnicomplete
set omnifunc=syntaxcomplete#Complete

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User Interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Keep 3 lines when scrolling
set scrolloff=3

" Ignore case when searching...
set ignorecase

" Unless asked for
set smartcase

" Highlight search results
set hlsearch

" Incremental search
set incsearch

" Highlight search results
set lazyredraw

" Turn off annoying beeps
set noerrorbells
set visualbell " Need this to stop beeping when hitting ESC

" Show matching brackets
set showmatch

" Blink when matching brackets
set mat=2

" Enable numbering on the left side
set number

" Add a bit extra margin to the left
set foldcolumn=1

" Set the list characters
set list
set listchars=trail:…,tab:>-

" Set the line wrap character
set showcmd                   " In select mode, show number of lines/chars/etc
set showbreak=↳\              " Add '↳ ' at linewraped lines

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable synta highlighting
syntax enable

" Set the font
"set guifont=DejaVu\ Sans\ Mono:h11
set guifont=Menlo\ Regular:h14

" Set the color scheme
"colors smyck
"colors solarized
"silent! colorscheme winter
"silent! colorscheme hybrid
silent! colorscheme default
set background=light

" All comments in the gui are italicized
highlight Comment gui=italic

" set colorcolumn
"if exists('+colorcolumn')
"  execute "set colorcolumn=" . join(range(81,335), ',')
"  "set colorcolumn=80
"endif


" Set extra options when running in GUI mode
if has("gui_running")
  set guioptions-=T
  set guioptions+=e
  set guioptions-=r
  set guioptions-=R
  set guioptions-=l
  set guioptions-=L
  set t_Co=256
  set guitablabel=%M\ %t
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab, indents
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use spaces rather than tabs
set expandtab

" Be smart about using tabs
set smarttab

" 1 tab = 2 spaces
set shiftwidth=2
set tabstop=8

" Auto indent
set ai

" Smart indent
set si

" Wrap lines
set wrap

" One space after periods
set nojoinspaces

" http://vimcasts.org/episodes/tidying-whitespace
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@\ 
  let l = line(".")
  let c = col(".")
  " Do the business
  %s/\s\+$//e
  " Cleanup: restore previous search history, and cursor position
  let @/=_s
  call cursor(l,c)
endfunction

" <F12> - remove trailing whitespace
nnoremap <silent> <F12> :call <SID>StripTrailingWhitespaces()<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around, tabs, windows, buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" <F8> - remove highlighting
map <F8> :nohls<CR>

" Automagically change directories when changing files
set autochdir

" Don't jump to the start of line when paging
set nostartofline

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status Line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Get the highlight group under the cursor
function! SyntaxItem()
  return synIDattr(synID(line("."),col("."),1),"name")
endfunction

" Always show the status line
set laststatus=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing mapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remap 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remove any trailing whitespace that is in the file
"autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Next Tab
nnoremap <silent> <C-Right> :tabnext<CR>

" Previous Tab
nnoremap <silent> <C-Left> :tabprevious<CR>

" New Tab
nnoremap <silent> <C-t> :tabnew<CR>

" Space to toggle folds
nnoremap <space> za

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status Bar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Get the color scheme name
function! ShowColorSchemeName()
  try
    return g:colors_name
  catch
    return "default
  endtry
endfunction

"" " Get the word count
"" let g:word_count="<unknown>"
"" function! WordCount()
""   return g:word_count
"" endfunction
"" 
"" function! UpdateWordCount()
""   let lnum = 1
""   let n = 0
""   while lnum <= line('$')
""     let n = n + len(split(getline(lnum)))
""     let lnum = lnum + 1
""   endwhile
""   let g:word_count=n
"" endfunction
"" 
"" augroup WordCounter
""   au! CursorHold * call UpdateWordCount()
""   au! CursorHoldI * call UpdateWordCount()
"" augroup END
"" 
"" set updatetime=500

" Set the status bar
function! SetStatusBar()
  " http://stackoverflow.com/questions/5375240/a-more-useful-statusline-in-vim
  hi User1 ctermfg=black  ctermbg=DarkRed     guifg=#ffdad8  guibg=#880c0e
  hi User2 ctermfg=black  ctermbg=DarkGreen   guifg=#000000  guibg=#F4905C
  hi User3 ctermfg=black  ctermbg=white       guifg=#292b00  guibg=#f4f597
  hi User4 ctermfg=black  ctermbg=white       guifg=#112605  guibg=#aefe7B
  hi User5 ctermfg=black  ctermbg=white       guifg=#051d00  guibg=#7dcc7d
  hi User6 ctermfg=black  ctermbg=DarkGrey    guifg=#000000  guibg=#888888
  hi User7 ctermfg=black  ctermbg=white       guifg=#ffffff  guibg=#880c0e  cterm=bold gui=bold
  hi User8 ctermfg=black  ctermbg=DarkCyan    guifg=#ffffff  guibg=#3366ff
  hi User9 ctermfg=black  ctermbg=DarkMagenta guifg=#ffffff  guibg=#810085
  hi User0 ctermfg=black  ctermbg=white       guifg=#ffffff  guibg=#094afe
  " Set the status line
  set statusline=
  set statusline+=%1*\ %t\ 
  set statusline+=%2*\ %y\ 
  set statusline+=%6*\ %h%m%r%w%=\ 
  set statusline+=%6*\ %{SyntaxItem()}\ 
  "set statusline+=%7*\ Words:%{WordCount()}\ 
  set statusline+=%8*\ Col:%v\ 
  set statusline+=%9*\ Row:%l/%L\ 
  set statusline+=%3*\ %{ShowColorSchemeName()}\ 
endfunction

" Call this to begin with
call SetStatusBar()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap the leader
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","

map <leader>ev = :tabnew ~/.vimrc<CR>
map <leader>sv = :source ~/.vimrc<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pathogen
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <leader>n :NERDTree<CR>

nmap <leader>D "=strftime('%a %b %d, %Y %T %Z')<CR>p
