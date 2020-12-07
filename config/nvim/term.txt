set nocompatible                      " disable compatiblity with vi
set textwidth=0 wrapmargin=0          " disable automatic line breaks
"set formatoptions-=t
set title                             " updates term window title to the current file

set hidden                            " hides buffers instead of closing them
set autoread                          " auto reload changes when a file changes outside of vim
set showcmd                           " show command in bottom bar
set lazyredraw                        " don't redraw during animations

"set list                              " highlight whitespace characters
"set listchars=tab:>.,trail:.,extends:#,nbsp:.

set scrolloff=8                       " scroll when we're 8 lines away from margin

                                      " store backup files in ~/.vim-tmp and friends
"set backupdir=~/.vim-tmp,~/.tmp,/var/tmp,/tmp
"set directory=~/.vim-tmp,~/.tmp,/var/tmp,/tmp

"highlight LineNr ctermfg=8            " change the colour of the line numbers to use palette 8 which is often gray

set number                            " show line numbers
set relativenumber                    " make the line number relative

set cursorline                        " highlight current line

set softtabstop=4                     " number of spaces in tab when editing
set tabstop=4                         " number of visual spaces per TAB
set expandtab                         " tabs are spaces
set shiftwidth=4                      " the amount to reindent when using << and >>.
set shiftround                        " use multiple of shiftwidth when indenting with '<' and '>'
