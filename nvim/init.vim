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

" Configure column highlight
set colorcolumn=80
hi ColorColumn ctermbg=242 guibg=#4c4c4c


call plug#begin()

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Theme
Plug 'NLKNguyen/papercolor-theme'

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

" Color Scheme
:colorscheme PaperColor


" Support for ALE
let g:ale_linters = {'c':['betty-style', 'betty-doc', 'gcc']}

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

nmap <F6> :TagbarToggle<CR>

:set completeopt-=preview " For No Previews

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-tsserver', 'coc-html', 'coc-css', 'coc-clangd', 'coc-pyright', 'coc-cmake', 'coc-copilot', 'coc-eslint', 'coc-go', 'coc-html-css-support', 'coc-jedi', 'coc-phpls', 'coc-ltex', 'coc-markdownlint', 'coc-prettier', 'coc-sh', 'coc-rome', 'coc-svelte']

" Clipboard Support For WSL (:h clipboard)
:set clipboard+=unnamedplus

let g:clipboard = {
			\	'name': 'WslClipboard',
			\	'copy': {
			\	'+': 'clip.exe',
			\	'*': 'clip.exe',
			\	},
			\	'paste': {
			\	'+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
			\	'*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r",""))',
			\	},
			\	'cache_enabled': 0,
			\}

" Autocomplete using the tab key
inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
inoremap <silent><expr> <cr> "\<c-g>u\<CR>"
