augroup terminal
  autocmd!
  autocmd BufEnter,TermOpen term://* startinsert
  autocmd TermOpen * setlocal nonumber norelativenumber signcolumn=no
augroup end

augroup interface
  autocmd!
  " autocmd InsertEnter,CmdLineEnter * set norelativenumber | redraw
  " autocmd InsertLeave,CmdlineLeave * set relativenumber
augroup END

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
  autocmd FileType * setlocal omnifunc=syntaxcomplete#Complete
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType javascript comp eslint
  autocmd BufWritePost *.js silent make! <afile> | silent redraw!
augroup END

