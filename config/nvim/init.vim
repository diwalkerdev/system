" source ${HOME}/.config/nvim/term.vim
" source ${HOME}/.config/nvim/editor.vim
" source ${HOME}/.config/nvim/movement.vim
" source ${HOME}/.config/nvim/remaps.vim

call plug#begin()
Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

set nocompatible                      " disable compatiblity with vi
set textwidth=0 wrapmargin=0          " disable automatic line breaks
set formatoptions-=t

nnoremap <C-p> :FZF<Enter>
