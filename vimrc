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

set nocompatible
filetype off 

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'

" Language
Plugin 'pangloss/vim-javascript'
Plugin 'digitaltoad/vim-jade.git'
Plugin 'itspriddle/vim-jquery.git'
Plugin 'kchmck/vim-coffee-script'
Plugin 'wavded/vim-stylus'
Plugin 'jimmyhchan/dustjs.vim'
Plugin 'tomtom/tcomment_vim.git'
Plugin 'mustache/vim-mustache-handlebars'

" Utilities
Plugin 'kien/ctrlp.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/syntastic.git'
Plugin 'tpope/vim-surround.git'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'mmozuras/snipmate-mocha'
Plugin 'tpope/vim-fugitive'
Plugin 'motemen/git-vim'
Plugin 'raimondi/delimitmate'
Plugin 'vim-scripts/SyntaxRange'
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-misc'

" UI
Plugin 'scrooloose/nerdtree.git'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'bling/vim-airline'

call vundle#end()
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

command! -nargs=* Wrap set wrap linebreak nolist
" Toggle spell checking on and off with `,s`
nmap <silent> <leader>s :set spell!<CR>
" Set region to British English
set spelllang=en_us


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

" Ag
ca Ag Ag!

" Airline
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'

" Neocomplcache
" let g:acp_enableAtStartup = 0
" let g:neocomplcache_enable_at_startup = 1
" let g:neocomplcache_enable_smart_case = 1
" let g:neocomplcache_min_syntax_length = 3
" let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Unite
" let g:unite_source_history_yank_enable = 1
"
" let g:unite_split_rule = 'botright'
" let g:unite_enable_start_insert = 1
" let g:unite_winheight = 10
"
" let g:unite_source_file_mru_long_limit = 3000
" let g:unite_source_directory_mru_long_limit = 3000
"
" if executable('ag')
"   let g:unite_source_grep_command = 'ag'
"   let g:unite_source_grep_default_opts = '--literal'
"   let g:unite_source_grep_recursive_opt = ''
" endif
"
" let g:unite_source_rec_max_cache_files = 0
" call unite#custom#source('file_rec,file_rec/async',
" \ 'max_candidates', 0)

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

" call unite#filters#matcher_default#use(['matcher_fuzzy'])
" nnoremap <leader>t :<C-u>Unite file_rec/async<CR>
" nnoremap <leader>b :<C-u>Unite buffer file_mru bookmark<CR>
" nnoremap <leader>y :<C-u>Unite history/yank<CR>
" " Custom mappings for the unite buffer
" autocmd FileType unite call s:unite_settings()
" function! s:unite_settings()
"   " Enable navigation with control-j and control-k in insert mode
"   imap <buffer> <C-j> <Plug>(unite_select_next_line)
"   imap <buffer> <C-k> <Plug>(unite_select_previous_line)
"   imap <buffer> <ESC> <Plug>(unite_exit)
" endfunction

nnoremap <leader>t :CtrlP<cr>
nnoremap <leader>T :CtrlPClearCache<cr>
nnoremap <leader>b :CtrlPBuffer<cr>


nnoremap <silent> Q :call CloseWindowOrKillBuffer()<CR>
nnoremap <leader>so :so %<CR>

nmap <c-p> <Plug>yankstack_substitute_older_paste
nmap <c-P> <Plug>yankstack_substitute_newer_paste
nnoremap <leader>y :Yank<cr>

nnoremap <leader>ag :AgFromSearch!<cr>

" ," Surround a word with "quotes"
map <leader>" ysiw"
vmap <leader>" c"<C-R>""<ESC>

" ,' Surround a word with 'single quotes'
map <leader>' ysiw'
vmap <leader>' c'<C-R>"'<ESC>

" ,) or ,( Surround a word with (parens)
" The difference is in whether a space is put in
map <leader>( ysiw(
map <leader>) ysiw)
vmap <leader>( c( <C-R>" )<ESC>
vmap <leader>) c(<C-R>")<ESC>

" ,[ Surround a word with [brackets]
map <leader>] ysiw]
map <leader>[ ysiw[
vmap <leader>[ c[ <C-R>" ]<ESC>
vmap <leader>] c[<C-R>"]<ESC>

" ,{ Surround a word with {braces}
map <leader>} ysiw{
map <leader>{ ysiw}
vmap <leader>} c{ <C-R>" }<ESC>
vmap <leader>{ c{<C-R>"}<ESC>

map <leader>` ysiw`

nnoremap ,w :StripTrailingWhitespaces<CR>

"Clear current search highlight by double tapping //
nnoremap <silent> // :nohlsearch<CR>

" ,ow = 'overwrite word', replace a word with what's in the yank buffer
nnoremap ,ow "_diwhp

" Make 0 go to the first character rather than the beginning
nnoremap 0 ^
nnoremap ^ 0

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

" Semicolon magic
" inoremap <leader>; <C-o>m`<C-o>A;<C-o>`` 
" If there isn't one, append a semi colon to the end of the current line.
function! s:appendSemiColon()
  if getline('.') !~ ';$'
    let original_cursor_position = getpos('.')
    exec("s/$/;/")
    call setpos('.', original_cursor_position)
  endif
endfunction

" For programming languages using a semi colon at the end of statement.
imap ;; <esc>:call <SID>appendSemiColon()<cr>a
nmap <silent> ;; :call <SID>appendSemiColon()<cr>

" ///////////////////////////////////
" / UI
" ///////////////////////////////////

if has('gui_running')
  set guifont=Inconsolata-dz\ for\ Powerline:h13
  colorscheme Tomorrow-Night-Eighties

  hi! link dustKey Structure
  hi! link dustHelper Constant
  hi! link dustPartial Directory
  hi! link dustStartSectionTag Directory
  hi! link dustSelfClosingSectionTag Directory
  hi! link dustEndSectionTag Directory
  hi! link dustSpecialChars Type
  hi! link dustFilter Identifier
  hi! link dustConditional Type
  hi! link dustContext String

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
