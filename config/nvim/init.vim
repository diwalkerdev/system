
call plug#begin()
" Nord theme
Plug 'arcticicestudio/nord-vim'

" FZF
Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Language client
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh'
    \ }

call plug#end()


let g:LanguageClient_serverCommands = {
    \ 'cpp': ['clangd'],
    \ }

nnoremap <C-p> :FZF<Enter>

" note that if you are using Plug mapping you should not use `noremap` mappings.
nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
nmap <silent>K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> <F2> <Plug>(lcn-rename)


source ${HOME}/.config/nvim/term.vim
" source ${HOME}/.config/nvim/editor.vim
" source ${HOME}/.config/nvim/movement.vim
" source ${HOME}/.config/nvim/remaps.vim
