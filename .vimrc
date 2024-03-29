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

" FIX: ssh from wsl starting with REPLACE mode
" https://stackoverflow.com/a/11940894
if $TERM =~ 'xterm-256color'
  set noek
endif

" set leader to ,
let mapleader = "," " Leader is the ',' key
let g:mapleader = ","
let maplocalleader = "`"
let g:maplocalleader = "`"
nnoremap <SPACE> <Nop>

"Switch to current dir
nmap ,cd :cd %:p:h<cr>

" this is deli
" new tab

map ,tn :tabnew<CR>
" close tab
map ,tc :tabclose<CR>

"---------------------------------------------------------------------------
" PROGRAMMING SHORTCUTS
"---------------------------------------------------------------------------

set cot-=preview "disable doc preview in omnicomplete

" {{ ENCODING SETTINGS
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1
" }}

" map kj to Escape
inoremap kj <ESC>

" deli
" leader hotkeys
nmap ,x2 :sp<CR>
nmap ,x3 :vs<CR>
nmap ,x1 <C-W>o
nmap ,x0 :close<CR>
nmap ,sa :sp<CR>
nmap ,sd :vs<CR>
nmap ,oo <C-W>o
nmap ,xk :close<CR>
nmap ,xf :CtrlP<CR>
nmap ,kk :CtrlP<CR>
nmap ,xb :CtrlPBuffer<CR>
nmap ,hr :CtrlPMRU<CR>
nmap ,gt :CtrlPTag<CR>
nmap <leader>n ]n
nmap <leader>p [n
nmap ,dg1 ]nd]n[ndd[ndd
nmap ,dg2 d]ndd]ndd
nmap <leader>nc ]c
nmap <leader>pc [c
" {{
noremap ,wh <C-W>h
noremap ,wj <C-W>j
noremap ,wk <C-W>k
noremap ,wl <C-W>l
" }}"
nmap ,tr :%s/ \+$//g<CR>
nmap ,cg :CtrlPRoot<CR>
nmap ,xc :suspend<CR>

" gui font config
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=inconsolata:h15
    colorscheme dracula
  endif
endif


" Copy/Paste, can only handle lines
" ',aa' => copy
" ',zz' = paste
" Vim always copy lines!
" Stackoverflow doesn't help.
" let s:uname = system("echo -n \"$(uname)\"")
if has('clipboard')
    vnoremap ,aa "+y
                \:echo 'Selection => clipboard'<cr>
    nnoremap ,aa "+yy
                \:echo 'Line(s) => clipboard'<cr>
    nnoremap ,pp "+p
elseif executable('xclip')
  " Linux
  vnoremap ,aa :w !xclip -selection clipboard -in<CR><CR>
        \:echo 'Selection => clipboard'<CR>
  nnoremap ,aa V:w !xclip -selection clipboard -in<CR><CR>
        \:echo 'Line(s) => clipboard'<cr>
  nnoremap ,zz :silent :r!xclip -selection clipboard -out<CR>
elseif executable('pbcopy')
  " OS X
  vnoremap ,aa :w !pbcopy<CR><CR>
        \:echo 'Selection => clipboard'<CR>
  nnoremap ,aa V:w !pbcopy<CR><CR>
        \:echo 'Line(s) => clipboard'<cr>
  nnoremap ,zz :silent :r!pbpaste<CR>
else
  " windows (cygwin)
  vnoremap ,aa :w !putclip<CR><CR>
        \:echo 'Selection => clipboard'<CR>
  nnoremap ,aa V:w !putclip<CR><CR>
        \:echo 'Line(s) => clipboard'<cr>
  nnoremap ,zz :silent :r!getclip<CR>
endif

let g:DiffModeSync = 1
" should be placed at last
syntax on " syntax highlight

" vertical diffsplit
set diffopt+=vertical
" better diff algorithm from xdiff
" code checked into vim repo in c93262b2e
" @see https://vimways.org/2018/the-power-of-diff/
" @see https://raw.githubusercontent.com/ashfinal/vimrc-config/master/.vimrc
if has("patch-8.1.360") || has("nvim-0.3.5")
  set diffopt+=algorithm:histogram
  set diffopt+=indent-heuristic
endif

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif 

"
" Local Variables:
" coding: utf-8
" indent-tabs-mode: nil
" tab-width: 2
" End:
" vim: set fenc=utf-8 et ts=2 sts=2 sw=2 foldmethod=marker :

" below are some vim plugins for demonstration purpose.
" add the plugin you want to use here.
"
"call plug#begin('~/AppData/Local/nvim/plugged')
"Plug 'joshdick/onedark.vim'
"Plug 'iCyMind/NeoSolarized'
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"call plug#end()

