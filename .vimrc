execute pathogen#infect()

syntax on
filetype plugin indent on


" My movement remaps
" Fast jump left and right
nnoremap <C-left><C-left> 0
vnoremap <C-left><C-left> 0
nnoremap <C-right><C-right> $
vnoremap <C-right><C-right> $

" Fast jump up and down
"nnoremap <C-up><C-up> 10k
"nnoremap <C-down><C-down> 10j

"Show unprintable characters
set list                                                " Display unprintable characters f12 - switches
set listchars=tab:•\ ,trail:•,extends:»,precedes:«      " Unprintable chars mapping


" Misc customizations
" sourced from https://gist.github.com/JeffreyWay/6753834
set linespace=25
set showmode                    " always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set smarttab
set tags=tags
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
set timeout timeoutlen=200 ttimeoutlen=100
set visualbell                  " don't beep
set noerrorbells                " don't beep
set autowrite                   " Save on buffer switch
"set mouse=a

" Auto change directory to match current file ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" easier window navigation
nmap <C-left> <C-w>h
nmap <C-down> <C-w>j
nmap <C-up> <C-w>k
nmap <C-right> <C-w>l


" Theme selection
set background=light            " options: dark | light
set t_Co=256
colorscheme PaperColor          " https://github.com/NLKNguyen/papercolor-theme


" Swap files out of the project root
set backupdir=~/.vim/backup/
set directory=~/.vim/swap/


" Plugin: Airline
set laststatus=2	" enable the plugin

" Plugin: Nerdtree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1


" Plugin: delimitMate           https://github.com/vim-scripts/delimitMate.vim
" let loaded_delimitMate = 0
let mapleader=","
let delimitMate_autoclose = 1
let delimitMate_matchpairs = "(:),[:],{:},<:>"
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 1
let delimitMate_expand_inside_quotes = 1
let delimitMate_quotes = "\" ' ` *"
au FileType python let b:delimitMate_quotes = "\" `"
au FileType markdown let b:delimitMate_quotes = "\" ` *"
au FileType tex let b:delimitMate_quotes = "'"
au BufRead,BufNewFile *.{txt} let b:delimitMate_quotes = "` \""
let delimitMate_nesting_quotes = ['"','`']
au FileType python let b:delimitMate_nesting_quotes = ['"']
let delimitMate_excluded_ft = "mail,txt"



" following lines from https://gist.github.com/gglanzani/3435030
let delimitMate_autoclose = 1
let delimitMate_matchpairs = "(:),[:],{:},<:>"
let delimitMate_expand_space = 0
let delimitMate_quotes = "\" ' ` *"
au FileType python let b:delimitMate_quotes = "\" `"
au FileType markdown let b:delimitMate_quotes = "\" ` *"
au FileType tex let b:delimitMate_quotes = "'"
au BufRead,BufNewFile *.{txt} let b:delimitMate_quotes = "` \""
let delimitMate_nesting_quotes = ['"','`']
au FileType python let b:delimitMate_nesting_quotes = ['"']
let delimitMate_excluded_ft = "mail,txt"

" Plugin MRU https://github.com/yegappan/mru  docs: http://www.vim.org/scripts/script.php?script_id=521
let MRU_Use_Current_Window = 1
" Make MRU easy to open
noremap <leader>m <ESC>:MRU<CR>

" Plugin Command-T https://github.com/wincent/command-t  !! requires ruby
