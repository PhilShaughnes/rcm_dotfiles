setlocal spell
set wrap linebreak

autocmd VimResized * | set columns=120

setlocal colorcolumn=72
setlocal textwidth=72

" autoformat (a), and recognize numbers (n)
setlocal formatoptions+=an
