" acgq's vimrc
set nocompatible " not compatible with the old-fashion vi mode
set bs=2  " allow backspacing over everything in insert mode
set history=1024  " command line history
set ruler  " show the cursor position all the time
set autoread  " auto read when file is changed from outside
set number " show line numbers
set ignorecase " ignore case when searching
" ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc,*.elc,*.a,*.lib
set autoindent  " auto indentation
set incsearch  " incremental search
set nobackup  " no *~ backup files
set copyindent  " copy the previous indentation on autoindenting
set smartcase  " ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab  " insert tabs on the start of a line according to context

set hlsearch  " search highlighting
set tags=./tags;

" syntastic has some performance impact.

set clipboard=unnamed " yank to the system register (*) by default
set showmatch  " Cursor shows matching ) and }
set showmode  " Show current mode
set wildchar=<TAB> " start wild expansion in the command line using <TAB>
set wildmenu            " wild char completion menu

" {{ TAB setting
set expandtab        "replace <TAB> with spaces
set softtabstop=4
set shiftwidth=4
" }}

" status line {
set laststatus=2
set statusline=%-10.3n  "buffer number
set statusline+=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c      "cursor column
set statusline+=\ %P    "percent through file
"}

