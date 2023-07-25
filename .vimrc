""" My basic vimrc config
""" Taken from https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/

" Disable compatibility with vi.
set nocompatible

set encoding=utf-8
set fileencoding=utf-8

" Enable filetype detection.
filetype on

" Enable plugins and load for detected filetype.
filetype plugin on

" Load an indent file for detected filetype.
filetype indent on

" Turn on syntax highlighting.
syntax on

" Add numberline
set number
set relativenumber

set shiftwidth=4
set tabstop=4

" Use space char instead of tabs.
set expandtab

" Do not save backup file
set nobackup

" Keep minimal N line in view when scrolling
set scrolloff=10

set nowrap

" While searching though a file, incrementally highlight mathing char/string
set incsearch

" Highlight current line with cursor
set cursorline

" Ignore capital letter during search
set ignorecase

" Override ignorecase option for searching capital letters
set smartcase

" Show partial command in last line of screen
set showcmd

" Show mode in last line
set showmode

" Show matching words during a search
set showmatch

" Use highlighting when searching
set hlsearch

" Set command history to save. (Default=20
set history=1000

" Enabling auto-complete in menu.
set wildmenu

" Make wildmenu behave like similar to Bash-Completions.
set wildmode=list:longest

" Ignore this filetype for editing in vim.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pyc,*.exe,*.flv,*.img,*.xlsx

set termguicolors

let g:polyglot_disabled = ['markdown']

" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

    Plug 'dense-analysis/ale'
    Plug 'preservim/nerdtree' 
    Plug 'itchyny/lightline.vim'
    Plug 'sainnhe/gruvbox-material'
    Plug 'sheerun/vim-polyglot'

call plug#end()

" }}}

" MAPPINGS --------------------------------------------------------------- {{{

" Set backslash as leader key.
let mapleader = "\\"

" Press \\ to jump back to the last cursor position.
nnoremap <leader>\ ``

" Type jj to exit insert mode quickly.
inoremap jj <Esc>

" Press spacebar to type the : char in command mode
nnoremap <space> :

" Pressing the letter o will open new line below current one.
" Exis insert mode after creating a new line above or below the current line.
noremap o o<Esc>
nnoremap O O<Esc>

" Center cursor vertically when moving to the next word during search.
nnoremap n nzz
nnoremap N Nzz

" Yank from cursor to the end of line.
nnoremap Y y$

" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or
" CTRL+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, CTRL+RIGHT.
nnoremap <c-up> <c-w>+
nnoremap <c-down> <c-w>-
nnoremap <c-left> <c-w>>
nnoremap <c-right> <c-w><

" NERDTree specific mappings.
" Map the Ctrl+o key to toggle NERDTree open and close.
nnoremap <c-o> :NERDTreeToggle<CR>

" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
        autocmd!
            autocmd FileType vim setlocal foldmethod=marker
augroup END

" If filetype HTML, set indent to 2 spaces.
autocmd Filetype HTML setlocal tabstop=2 shiftwidth=2 expandtab

" If Vim version > 7.2 enable undofile.
" This allows you to undo changes to a file even after saving it.
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

if !has('gui_running')
    set t_Co=256
endif


" Important!!
if has('termguicolors')
     set termguicolors
endif

" For dark version.
set background=dark

" Set contrast.
" This configuration option should be placed before `colorscheme gruvbox-material`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_material_background = 'soft'
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_statusline_style = 'mix'

" For better performance
let g:gruvbox_material_better_performance = 1

colorscheme gruvbox-material

" }}}

" STATUS LINE ------------------------------------------------------------ {{{

" Clear status line when vimrc is reloaded.
"set statusline=

" Status line left side.
"set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
"set statusline+=%=

" Status line right side.
"set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

" }}}

