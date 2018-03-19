"Behavior Settings
:set hidden
:set history=1000 
:set ignorecase
:set smartcase 
:set title
:set scrolloff=3
:set backupdir=~/.vim/.backup//
:set directory=~/.vim/.swp//
:set undodir=~/.vim/.undo//
:set backspace=indent,eol,start
:set hlsearch
:set incsearch
:set visualbell
"Language Settings
:set langmenu=none
:language C
"Programming
:set nu
:set ruler
:set tabstop=8
":set autoindent
:set cindent
:colorscheme delek 
:set wildmenu
:set wildmode=list:longest
:syntax on
:filetype on
:filetype plugin on
:filetype indent on
"KeyMapping Settings
nnoremap ' `
nnoremap ` '
"Macros
runtime macros/matchit.vim
set clipboard=unnamed
