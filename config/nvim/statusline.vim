function! GitBranchName()
    " Pipe errors to null and strip any newline characters.
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction


function! StatusLineGit()
    let l:branch_name = GitBranchName()
    return strlen(l:branch_name) > 0 ? ' '.l:branch_name.' \| ':''
endfunction


" Mode highlighting
" Note, au is auto command.
au InsertEnter * hi statusline guifg=black guibg=#d7afff ctermfg=0 ctermbg=5
au InsertLeave * hi statusline guifg=black guibg=#8fbfdc ctermfg=0 ctermbg=2

" Status Line Custom
let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'Normal·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ "\<C-V>" : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ "\<C-S>" : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
    \}

" Do not define User0
hi User1 ctermfg=7 ctermbg=8 guibg=#bf616a guifg=#bf616a 
hi User2 ctermfg=8 ctermbg=0 guibg=#d08770 guifg=#adadad
hi User3 ctermfg=0 ctermbg=0 guibg=#ebcb8b guifg=#303030
hi User4 ctermfg=14 ctermbg=12 guibg=#b48ead guifg=#4e4e4e
hi User5 ctermfg=11 ctermbg=0 guibg=#b48ead guifg=#4e4e4e

set statusline=
set statusline+=%0*\ %n\                                 " Buffer number
set statusline+=%5*%{StatusLineGit()}
set statusline+=%1*\ %<%F%m%r%h%w\                       " File path, modified, readonly, helpfile, preview
set statusline+=%3*│                                     " Separator
set statusline+=%2*                                 " FileType
"set statusline+=%2*\ %Y\                                 " FileType
"set statusline+=%3*│                                     " Separator
"set statusline+=%2*                                     " Separator
"set statusline+=%2*\ %{''.(&fenc!=''?&fenc:&enc).''}     " Encoding
"set statusline+=\ (%{&ff})                               " FileFormat (dos/unix..)
set statusline+=%=                                       " Right Side
set statusline+=%2*\ col:\ %02v\                         " Colomn number
set statusline+=%3*│                                     " Separator
set statusline+=%1*\ ln:\ %02l/%L\ (%3p%%)\              " Line number / total lines, percentage of document
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}\  " The current 

" hi is highlight. This makes the changes apply on first load.
hi statusline guifg=black guibg=#8fbfdc ctermfg=0 ctermbg=2
