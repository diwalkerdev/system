function! Formatonsave()
  let l:formatdiff = 1
  py3f /usr/share/clang/clang-format.py
endfunction

augroup formatting
    autocmd!
    autocmd BufWritePre *.h,*.hpp,*.c,*.cc,*.cpp call Formatonsave()
augroup end


