execute pathogen#infect()
filetype plugin indent on

" be iMproved
set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL

" Sets how many lines of history VIM has to remember
set history=1000

" Set to auto read when a file is changed from the outside
set autoread

" Leader key remap
let mapleader = ","
let g:mapleader = ","

" Longer timeout
set timeout timeoutlen=1500

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" A buffer becomes hidden when it is abandoned
set hidden

" Turn swapfiles off
set noswapfile

" Command-line completion
set wildmenu
"
" Don't fold automatically
set foldmethod=manual

" No error sound/flash
set noerrorbells

" Don't redraw while executing macros. Better performance!
set lazyredraw

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SCROLLING

" Start scrolling when we're 4 lines away from margins
set scrolloff=2
set sidescrolloff=15
set sidescroll=30

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI

"syntax
syntax on

" Always show current position
set ruler

" Line wraping
set nowrap

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Always show status line at the bottom
set laststatus=2

" 80 column rule
set colorcolumn=80

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLORS AND FONTS

" Enable syntax highlighting
syntax on

set background=light
set t_Co=256
colorscheme lucius
LuciusWhiteHighContrast

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GUI SETTINGS

if has('gui_running')
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar

    set guitablabel=%M\ %t

    " set block cursor
    set guicursor=n-v-c-i:block-Cursor

    " set font
    if has('gui_win32')
        set guifont=DejaVu_Sans_Mono:h8:cANSI
    else
        set guifont=DejaVu\ Sans\ Mono\ 8
    endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SEARCH

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Do not wrap around
set nowrapscan

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INDENTATION

" Use spaces instead of tabs
set expandtab

" 1 tab = 4 spaces
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Be smart
set autoindent
set smartindent
set smarttab

" Show tabs as charachrers
set list
set listchars=tab:>-

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM MAPPINGS

" <S-k> puts vim to background and runs command under the cursor.
" I sometimes hit this accidentally and never on purpose.
map <S-k> <Nop>

" Paste toggle shortcut. Useful then pasting from system clipboard
set pastetoggle=<F7>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Completion popup

" insert only longest matching part
set completeopt=longest,menuone

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" USEFUL THINGS

" Search for selected word
vnoremap // y/<C-R>"<CR>"

" Delete buffer without closing the window
command BD bp|bd #

" Delete forward mapping
inoremap <C-d> <Del>

" Remove all trailing whitespace
command RemoveTrailingWhitespace :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Highlight extra whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN SETTINGS

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar

nmap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GitGutter

set updatetime=1000

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDtree

map <C-\> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeMapOpenVSplit='i'
let NERDTreeMapOpenSplit='s'
nnoremap <leader>nf :NERDTreeFind<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fugitive

nnoremap <leader>gs :Gstatus<CR><C-w>10+
" nnoremap <leader>ga :Git add %:p<CR><CR>
" nnoremap <leader>gc :Gcommit -v -q<CR>
" nnoremap <leader>gt :Gcommit -v -q %:p<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
" nnoremap <leader>gp :Ggrep<Space>
" nnoremap <leader>gm :Gmove<Space>
" nnoremap <leader>gb :Git branch<Space>
" nnoremap <leader>go :Git checkout<Space>
" nnoremap <leader>gps :Dispatch! git push<CR>
" nnoremap <leader>gpl :Dispatch! git pull<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP

" Open buffer tab by default
let g:ctrlp_cmd = 'CtrlPBuffer'

" Don't switch to opened buffer
let g:ctrlp_switch_buffer = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Aairline

let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }
let g:airline_section_x=''
