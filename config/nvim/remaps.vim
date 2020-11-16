                                      " enter command mode by pressing ;
                                      " but remapping : to ; overwrites repeat command
" nnoremap ; :
" vnoremap ; :

                                      " exit insert mode
inoremap <A-n> <Esc>

                                      " easier window navigation
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

                                      " do things better by disabling arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

                                      " allows navigating lines when the line has been wrapped
                                      " but then this breaks navigation i.e. 4k
" nnoremap j gj
" nnoremap k gk

