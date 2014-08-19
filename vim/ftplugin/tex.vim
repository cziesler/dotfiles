"map <silent> <leader>c :!pdflatex --shell-escape %<CR>
map <silent> <leader>c :!latexmk -pdf -jobname=./tmp/%:r %<CR>
map <silent> <leader>o :!open %:r.pdf<CR>

map <silent> <leader>b :!bibtex %:r<CR>

set spell

set textwidth=80
set wrapmargin=2
