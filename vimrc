set encoding=utf-8          " use utf-8 encoding
set tabstop=4               " render space characters as 4 spaces
set softtabstop=4           " backspace erases all spaces to next tab stop
set shiftwidth=4            " use 4 spaces for each step of (auto)indent
set expandtab               " expand <Tab> keypresses to spaces
set scrolloff=10            " show 10 lines of context around cursor
set colorcolumn=81          " color column 81
set viminfo='20,<1000       " remember marks for previous 20 files;
                            " save max of 1000 lines for each region

syntax on                   " enable syntax highlighting
filetype plugin indent on   " enable filetype plugins and indentation rules

" highlight column 81
highlight ColorColumn ctermbg=236 guibg=#303030

" highlight tabs
autocmd BufNewFile,BufReadPost,FileReadPost * syntax match Tab "\t"
highlight Tab ctermbg=238 guibg=#444444

" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" map Ctrl-Arrow keys
map <ESC>[1;5A <C-Up>
map <ESC>[1;5B <C-Down>
map <ESC>[1;5C <C-Right>
map <ESC>[1;5D <C-Left>
