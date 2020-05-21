augroup TermOpen
  autocmd!
  autocmd BufEnter term://* startinsert
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup end

augroup saving
  autocmd!
  autocmd WinEnter,BufWinEnter,FocusGained * checktime
  autocmd FocusLost * silent! wa
augroup end

augroup quickfix
  autocmd!
  " automatic location/quickfix window
  autocmd QuickFixCmdPost [^l]* cwindow
  autocmd QuickFixCmdPost    l* lwindow
  autocmd VimEnter            * cwindow
augroup END

augroup filetypes
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType javascript comp eslint
  autocmd BufWritePost *.js silent make! <afile> | silent redraw!
augroup END

