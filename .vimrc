"
" ██╗  ██╗██████╗ ███████╗███╗   ██╗
" ██║  ██║██╔══██╗██╔════╝████╗  ██║
" ███████║██║  ██║███████╗██╔██╗ ██║
" ██╔══██║██║  ██║╚════██║██║╚██╗██║
" ██║  ██║██████╔╝███████║██║ ╚████║
" ╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═══╝
"

" ///////////////////////////////////
" / Vundle
" ///////////////////////////////////

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle "gmarik/vundle"

" Language
Bundle "pangloss/vim-javascript"
Bundle "digitaltoad/vim-jade.git"
Bundle "itspriddle/vim-jquery.git"
Bundle "kchmck/vim-coffee-script"
Bundle "wavded/vim-stylus"
Bundle "jimmyhchan/dustjs.vim"
Bundle "tomtom/tcomment_vim.git"

" Utilities
Bundle "shougo/unite.vim"
Bundle "rking/ag.vim"
Bundle "scrooloose/syntastic.git"
Bundle "tpope/vim-surround.git"
Bundle "maxbrunsfeld/vim-yankstack"
Bundle "Shougo/neocomplcache.vim"
Bundle "Shougo/neosnippet.vim"
Bundle 'Shougo/neosnippet-snippets'

" UI
Bundle "scrooloose/nerdtree.git"
Bundle "chriskempson/vim-tomorrow-theme"
Bundle "bling/vim-airline"
Bundle "nathanaelkane/vim-indent-guides"

filetype plugin indent on

" ///////////////////////////////////
" / General Config
" ///////////////////////////////////

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set hidden

"turn on syntax highlighting
syntax on
" Change leader to a comma because the backslash is too far away
let mapleader=","

" Turn Off Swap Files
set noswapfile
set nobackup
set nowb

" Persistent Undo
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" Indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·
set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" Folds
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" Scrolling
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" Search
set incsearch       " Find the next match as we type the search
set hlsearch        " Hilight searches by default
set viminfo='100,f1 " Save up to 100 marks, enable capital marks
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" Cursor
set cursorline
set virtualedit=all

" ///////////////////////////////////
" / Plugin Settings
" ///////////////////////////////////

" Airline
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'

" Neocomplcache
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'


" ///////////////////////////////////
" / Keybinds
" ///////////////////////////////////

" ,n nerdtree
nnoremap <leader>n :NERDTree<cr>

" c-h,j,l,k windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-l> <C-w>l
nnoremap <C-k> <C-w>k

call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files -start-insert file_rec<CR>
nnoremap <leader>b :<C-u>Unite -no-split -buffer-name=buffer -start-insert buffer file_mru bookmark<CR>
" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j> <Plug>(unite_select_next_line)
  imap <buffer> <C-k> <Plug>(unite_select_previous_line)
  imap <buffer> <ESC> <Plug>(unite_exit)
endfunction

nnoremap <silent> Q :call CloseWindowOrKillBuffer()<CR>
nnoremap <leader>so :so %<CR>

nnoremap <c-p> <Plug>yankstack_substitute_older_paste
nnoremap <c-P> <Plug>yankstack_substitute_newer_paste

nnoremap <leader>ag :AgFromSearch<cr>

nnoremap <leader>{ ysiwB
nnoremap <leader>( ysiw(
nnoremap <leader>" ysiw"
nnoremap <leader>' ysiw'

nnoremap ,w :StripTrailingWhitespaces<CR>

"Clear current search highlight by double tapping //
nnoremap <silent> // :nohlsearch<CR>

" ,ow = 'overwrite word', replace a word with what's in the yank buffer
nnoremap ,ow "_diwhp

" Make 0 go to the first character rather than the beginning
nnoremap 0 ^
nnoremap ^ 0

" Surround
nnoremap ," ysiw"
nnoremap ,' ysiw'
nnoremap ,( ysiw)
vmap ,( c(<C-R>")<ESC>
nnoremap ,[ ysiw]
vmap ,[ c[<C-R>"]<ESC>
nnoremap ,{ ysiw}
vmap ,{ c{<C-R>"}<ESC>
nnoremap ,` ysiw`

"Move back and forth through previous and next buffers
nnoremap <silent> ,z :bp<CR>
nnoremap <silent> ,x :bn<CR>

" Create window splits easier
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" Resize windows with arrow keys
nnoremap <D-Up> <C-w>+
nnoremap <D-Down> <C-w>-
nnoremap <D-Left> <C-w><
nnoremap <D-Right>  <C-w>>

" Neocomplcache
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" ///////////////////////////////////
" / UI
" ///////////////////////////////////

if has('gui_running')
  set guifont=Inconsolata\ for\ Powerline:h16

  colorscheme Tomorrow-Night-Eighties
  hi! link dustRef Constant
  hi! link dustStartSectionTag Constant
  hi! link dustSelfClosingSectionTag Constant
  hi! link dustEndSectionTag Constant
  hi! link dustSpecialChars Type
  hi! link dustFilter Identifier
  hi! link dustConditional Constant
  hi! link dustConditional Constant
  hi! link CursorLineNr Comment

  set go-=r
  set go-=L
  set go-=T
endif

" ///////////////////////////////////
" / Functions
" ///////////////////////////////////

" Use Q to intelligently close a window
function! CloseWindowOrKillBuffer()
  let number_of_windows_to_this_buffer = len(filter(range(1, winnr('$')), "winbufnr(v:val) == bufnr('%')"))

  if matchstr(expand("%"), 'NERD') == 'NERD'
    wincmd c
    return
  endif
  if number_of_windows_to_this_buffer > 1
    wincmd c
  else
    bdelete
  endif
endfunction

" Strip trailing whitespace
" via: http://rails-bestpractices.com/posts/60-remove-trailing-whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
command! StripTrailingWhitespaces call <SID>StripTrailingWhitespaces()
