if has("syntax")
        syntax on
endif

:colorscheme morning
" Remove end of the line spaces and tabs
:map K :%s/[^I ][^I ]*$//^M
:set autoindent
:set autowriteall
:set expandtab
:set guifont=Courier\ 10\ Pitch\ 12
:set hlsearch
:set ignorecase
:set lines=60
:set nowrapscan
:set report=1
:set shiftwidth=3
:set tabstop=3
:set wrapmargin=2
:syntax on

" 1 tab => 4 spaces and tab using
set expandtab
set tabstop=4
set paste

" Remember the current line of last edit
if has("autocmd")
"filetype plugin indent on
  autocmd FileType text setlocal textwidth=78

" always jump to last edit position when opening a file
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif
endif

" Make hlsearch work like less
set hlsearch
" When searching is over, hit esc+h to hide search highlights
nnoremap <ESC>h :nohlsearch<CR>
hi Search ctermfg=black ctermbg=white

" Show lines numbers by defaults
set number
" Binding to show/hide line numbers
nnoremap <ESC>bb :se nonumber<CR>
nnoremap <ESC>bn :se number<CR>

" Encoding for utf8
if has("multi_byte")
  set encoding=utf-8
  setglobal fileencoding=utf-8
  set bomb
else
  echoerr "Sorry, this version of vim was not compiled with
  +multi_byte"
endif