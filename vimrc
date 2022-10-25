" -----------------------------------------------------------------------------
" Manage plugins with vim-plug
" -----------------------------------------------------------------------------
call plug#begin('~/.vim/begin')
" Auto completion
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

" Switch between header and source files
Plug 'ton/vim-alternate'

" Editing
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'

" Project navigation
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Display
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" -----------------------------------------------------------------------------
" Basic functionality
" -----------------------------------------------------------------------------

set encoding=utf-8

" Tabs to spaces
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent

" Allow backspace key to work from next line, etc
set backspace=indent,eol,start

" Display Preferences
syntax on
set termguicolors
colo gruvbox
set number relativenumber
hi Comment cterm=italic

set nowrap

set splitbelow
set splitright

" ------------------------------------------------------------------------------
" CoC.nvim - Autocompletion, LSP
" ------------------------------------------------------------------------------

function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" ------------------------------------------------------------------------------
" Nerd commenter - enable/disable chunks of text
" ------------------------------------------------------------------------------
let g:NERDSpaceDelims = 1

" ------------------------------------------------------------------------------
" Vim-Alternate - switch between header/source files
" ------------------------------------------------------------------------------
nmap <silent> <C-a> :Alternate<CR>

" ------------------------------------------------------------------------------
" NerdTree - Project navigation
" ------------------------------------------------------------------------------
" Open NERDTree every time vim opens
autocmd VimEnter * NERDTree | wincmd p
" Close NERDTree when no other window remains
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" ------------------------------------------------------------------------------
" vim-airline & vim-airline-theme - status line
" ------------------------------------------------------------------------------
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'gruvbox'

" ------------------------------------------------------------------------------
" Cursor config
" ------------------------------------------------------------------------------

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
