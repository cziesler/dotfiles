" Adapted from http://patmac.us/2015/01/12/vim-config-for-debugging-ruby.html
"
" Press <leader>pt when over a variable to print it

nnoremap <Leader>pt  "xyiwoprint "DEBUG (".__LINE__.") : [$]\n";<esc>F:"xPf$"xp
vmap     <Leader>pt  "xyoprint "DEBUG (".__LINE__.") : [$]\n";<esc>F:"xPf$"xp
