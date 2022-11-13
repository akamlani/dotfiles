" ########################################################################
" # VI Text Editor Setup
" ########################################################################

" Use the Solarized Dark theme
set background=dark

" tabs|indent
set autoindent      " Copy indent from last line when starting new line
set smartindent
set smarttab        " <Tab> inserts shiftwidth spaces, <BS>: deletes shiftwidths paces
set expandtab       " Expand tabs to spaces
set ts=2
set tabstop=2       " Potentially shift to 4 space
set shiftwidth=2    " The # of spaces for indenting
set softtabstop=2   " Tab key results in 2 spaces
set showtabline=2   " Always show tab bar

" Search
set ignorecase      " Ignore case of searches
set smartcase       " Ignore 'ignorecase' if search patter contains uppercase characters

" Highlights
set incsearch       " Highlight dynamically as pattern is typed
set hlsearch        " Highlight searches


" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

" turn syntax highlighting on by default
syntax on
filetype plugin indent on

" turn off compatibility with the old vi
set nocompatible

" turn on the "visual bell" - which is much quieter than the "audio blink"
set vb

" automatically show matching brackets. works like it does in bbedit.
set showmatch

" make that backspace key work the way it should
set backspace=indent,eol,start

" History
set history=1000    " Increase history from 20 default to 1000

" Filetype information
filetype on         " Enables filetype detection
filetype plugin on  " Enables filetype specific plugins
filetype indent on  " Respect filetype indentation

" Utils
set clipboard=unamedplus
set laststatus=2    " Always show status line
set mouse=r         " Enable mouse
set wildmenu        " Enhance command-line completion
set ruler           " Show the cursor position
set cursorline      " Highlight current line
set number          " Enable line numbers
set title           " Show the filename in the window title
set nocompatible    " Make Vim more useful

set diffopt=iwhite  " Ignore whitespace changes (focus on code changes)
set diffopt+=filler " Add vertical spaces to keep right and left aligned
