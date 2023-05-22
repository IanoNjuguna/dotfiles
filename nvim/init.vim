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

" Dark Mode is default
set background=dark

" Enable syntax highlighting
:syntax enable

call plug#begin()

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Retro Scheme
Plug 'https://github.com/rafi/awesome-vim-colorschemes'

" Polyglot
Plug 'sheerun/vim-polyglot'

" IDE
Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'}

" Developer Icons
Plug 'https://github.com/ryanoasis/vim-devicons'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

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

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.

" Wakatime Plugin
Plug 'wakatime/vim-wakatime'

" For Commenting gcc & gc
Plug 'https://github.com/tpope/vim-commentary'

" Asynchronous Linter Engine (ALE)
Plug 'dense-analysis/ale'
 
"Betty-ale-vim
Plug 'JuanDAC/betty-ale-vim'

" Surrounding ysw:
" provides mappings to easily delete, change and add
" surroundings like parentheses, brackets, quotes, XML tags, etc in pairs.
Plug 'http://github.com/tpope/vim-surround'

" Git Support
Plug 'https://github.com/tpope/vim-fugitive.git'

" NerdTree
Plug 'https://github.com/preservim/nerdtree'

" Status bar
Plug 'https://github.com/vim-airline/vim-airline'

"Airline Themes
Plug 'https://github.com/vim-airline/vim-airline-themes'

" CSS Color Preview
Plug 'https://github.com/ap/vim-css-color'

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
:colorscheme jellybeans

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" Support for air-line
let g:airline_powerline_fonts = 1
let g:airline_theme='iceberg'

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

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-tsserver', 'coc-html', 'coc-css', 'coc-clangd', 'coc-pyright']
