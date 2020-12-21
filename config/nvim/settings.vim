colorscheme nord
"syntax off
"set encoding=UTF-8

"Make sure space doen't have any mappings before assigning to leader.
nnoremap <SPACE> <Nop>    
let mapleader=" "

" set number relativenumber
set tabstop=4 
set shiftwidth=4 
set expandtab

set laststatus=2
set noshowmode
set hidden                  "Required for operations modifying multiple buffers like rename.

set nobackup                "This is recommended by coc
set nowritebackup           "This is recommended by coc


"set clipboard=unnamedplus "Copy and paste from vim and everything else.

"au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC
"let g:python3_host_prog='/usr/bin/python'

nnoremap <C-p> :FZF<Cr>
inoremap <C-c> <Esc>
inoremap <C-l> <Del>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Window resizing
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>
