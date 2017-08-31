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
" FOLDS

" Fold based on indent
set foldmethod=manual

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

    set t_Co=256
    set guitablabel=%M\ %t

    " set block cursor
    set guicursor=n-v-c-i:block-Cursor
    " turn off cursor blink
    set guicursor+=a:blinkon0

    " set font
    if has('gui_win32')
        set guifont=DejaVu_Sans_Mono:h8:cANSI
    else
        set guifont=DejaVu\ Sans\ Mono\ 8
    endif

    " maximize window on start
    " au GUIEnter * simalt ~x
    " set lines=999 columns=999
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

inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" USEFUL THINGS

" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
    let @/ = ''
    if exists('#auto_highlight')
        au! auto_highlight
        augroup! auto_highlight
        setl updatetime=4000
        echo 'Highlight current word: off'
        return 0
    else
        augroup auto_highlight
            au!
            au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
        augroup end
        setl updatetime=500
        echo 'Highlight current word: ON'
        return 1
    endif
endfunction

" Search for selected word
vnoremap // y/<C-R>"<CR>"

" Delete buffer without closing the window
command BD bp|bd #

" Delete forward mapping
inoremap <C-d> <Del>

" Remove all trailing whitespace
command RemoveTrailingWhitespace :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
" :nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Relative/absolute line numbers toggle
function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunc
nnoremap <leader>nt :call NumberToggle()<cr>

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
" Unite

nnoremap <leader>uf :<C-u>Unite file_rec/async -start-insert<CR>
nnoremap <leader>ub :<C-u>Unite buffer -start-insert<CR>
nnoremap <leader>ug :<C-u>Unite grep:.<CR>
nnoremap <leader>ur :<C-u>Unite register<CR>
nnoremap <leader>us :<C-u>Unite source<CR>
nnoremap <leader>uj :<C-u>Unite jump<CR>
nnoremap <leader>uo :<C-u>Unite output/shellcmd<CR>

if executable('ag')
    let g:unite_source_rec_async_command =
    \ ['ag', '--follow', '--nocolor', '--nogroup',
    \  '--hidden', '-g', '']
    let g:unite_source_grep_command='ag'
    let g:unite_source_grep_default_opts='--nogroup --nocolor --smart-case'
    let g:unite_source_grep_recursive_opt=''
    let g:unite_source_grep_encoding='utf-8'
elseif executable('pt')
    let g:unite_source_grep_command='pt'
    let g:unite_source_grep_default_opts='--nogroup --nocolor --smart-case'
    let g:unite_source_grep_recursive_opt=''
    let g:unite_source_grep_encoding='utf-8'
else
    let g:unite_source_grep_default_opts="-li"
endif

" call unite#custom#profile('default', 'context', {
" \   'start-insert': 1,
" \ })

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ag.vim
if !executable('ag')&&executable('pt')
    let g:ag_prg="pt --nogroup --column --smart-case"
endif
