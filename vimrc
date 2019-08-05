"----------------------------------------
" Jon Choukroun Vimrc configuration 
" thanks to Allan MacGregor
"----------------------------------------

"""" START Vundle Configuration 

" Disable file type for vundle
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Vim Utilities
Plugin 'majutsushi/tagbar'
Plugin 'vim-syntastic/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'janko/vim-test'

" Vim Theme/Appearance
Plugin 'joshdick/onedark.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'ryanoasis/vim-devicons'

" Language Support
Plugin 'sheerun/vim-polyglot'
Plugin 'leafgarland/typescript-vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'elixir-editors/vim-elixir'
Plugin 'slashmili/alchemist.vim'

call vundle#end()            " required
filetype plugin indent on    " required
"""" END Vundle Configuration 


"----------------------------------------
" Configuration Section
"----------------------------------------

set encoding=utf8
set incsearch
set smartindent
set autoindent
nnoremap <silent><C-L> :noh<CR><C-L>
set scrolloff=5
set nowrap

set hidden

set omnifunc=syntaxcomplete#Complete

set ttimeoutlen=10

" OSX stupid backspace fix
set backspace=indent,eol,start

" Show hybrid linenumbers
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

" New vertical pane splits right
set splitright

" Set Proper Tabs
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab

" Always display the status line
set laststatus=2

" Enable highlighting of the current line
set cursorline

" Theme and Styling 
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
end

syntax on

let g:ondedark_terminal_italics = 1
colorscheme onedark
hi Comment cterm=italic

set list listchars=space:⋅

" Vim-Airline Configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1 
let g:airline_theme='onedark'

" NerdCommenter Configuration
let g:NERDSpaceDelims = 1

" Syntastic Configuration
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_elixir_checkers = ['elixir']
let g:syntastic_enable_elixir_checker = 1

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'node_modules/.bin/eslint'
let g:syntastic_typescript_eslint_exec = 'node_modules/.bin/eslint'

let g:syntastic_handlebars_exec = 'node_modules/.bin/handlebars'
let g:syntastic_filetype_map = { 'html.handlebars': 'handlebars' }

" NERDTree Configuration
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

let NERDTreeShowLineNumbers = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1


"----------------------------------------
" Mappings configurationn
"----------------------------------------

map <F8> :TagbarToggle<CR>
map <C-n> :NERDTreeToggle<CR>

nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>


"---------------------------------------
" Cursor config
"---------------------------------------

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
