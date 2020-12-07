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


" Language Server
" ----------------------------------------------------------------------------
let g:LanguageClient_serverCommands = {
    \ 'cpp': ['clangd'],
    \ }

" Note that if you are using Plug mapping you should not use `noremap` mappings.
nmap <F5> <Plug>(lcn-menu)
nmap <silent>K <Plug>(lcn-hover)
nmap <silent>gd <Plug>(lcn-definition)
nmap <silent><F2> <Plug>(lcn-rename)

"nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
"nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
"nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>


" FZF
" ----------------------------------------------------------------------------
nnoremap <C-p> :FZF<Enter>

