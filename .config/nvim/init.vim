" Mouse settings
:set mouse=a

" Customise tabs length
:set tabstop=4 shiftwidth=4 smarttab softtabstop=4

" Indent automatically
:set autoindent

" Intelligent indentation for C code
:set smartindent
:set cindent

" Display the current line and column
:set number

" Enable syntax highlighting
syntax enable

" Configure column highlight
set colorcolumn=80

" Encoding
set encoding=UTF-8

call plug#begin()

" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Wakatime Plugin
Plug 'wakatime/vim-wakatime'

" Asynchronous Linter Engine (ALE)
Plug 'dense-analysis/ale'

"Betty-ale-vim
Plug 'JuanDAC/betty-ale-vim'

" Theme
Plug 'fcpg/vim-orbital'

"Vim Airline (Status Bar)
Plug 'vim-airline/vim-airline-themes'

" Vim Devicons
Plug 'ryanoasis/vim-devicons'

" Surrounding ysw)
Plug 'http://github.com/tpope/vim-surround'

" NerdTree
Plug 'https://github.com/preservim/nerdtree'

" For Commenting gcc & gc
Plug 'https://github.com/tpope/vim-commentary'

" Status bar
Plug 'https://github.com/vim-airline/vim-airline'

" PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/lifepillar/pgsql.vim'

" CSS Color Preview
Plug 'https://github.com/ap/vim-css-color'

" Auto Completion
Plug 'https://github.com/neoclide/coc.nvim'

" Developer Icons
Plug 'https://github.com/ryanoasis/vim-devicons'

" Vim Terminal
Plug 'https://github.com/tc50cal/vim-terminal'

" Tagbar for code navigation
Plug 'https://github.com/preservim/tagbar'

" CTRL + N for multiple cursors
Plug 'https://github.com/terryma/vim-multiple-cursors'

set encoding=UTF-8

call plug#end()

" Support for ALE
let g:ale_linters = {'c':['betty-style', 'betty-doc', 'gcc']}

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

nmap <F8> :TagbarToggle<CR>

:set completeopt-=preview " For No Previews

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" colorscheme
colo orbital

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
let g:coc_disable_startup_warning = 1
" To install Coc plugins:
"	:CocInstall coc-pyright
"	:CocInstall coc-clangd
"	:CocInstall coc-snippets
"	:CocCommand snippets.edit... FOR EACH FILE TYPE

" air-line config
" status bar at the top
let g:airline#extensions#tabline#enabled = 1

" status bar theme
let g:airline_theme='base16'

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" coc.nvim extensions
let g:coc_global_extensions = ['coc-json', 'coc-clangd', 'coc-css', 'coc-eslint', 'coc-html', 'coc-htmlhint', 'coc-markdownlint', 'coc-sh', 'coc-snippets', 'coc-tsserver', 'coc-prettier']

" Some servers have issues with backup files
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Make <CR> (ENTER Key) to accept selected completion item
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
