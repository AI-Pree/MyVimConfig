"Enable syntax highlighting
syntax on

" Enabling filetype detections, load ftpplugins and loads indents
filetype plugin indent on

" Adding plugins for my vim config using Plug

call plug#begin('~/.vim/plugged')
Plug 'preservim/NERDTree'
Plug 'junegunn/fzf', {'do': { -> fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors' "for multi-line cursors
Plug 'dense-analysis/ale' " For lSP
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'airblade/vim-gitgutter' " shows git changes in the file
Plug 'drewtempelmeyer/palenight.vim' " Theme for vim
Plug 'preservim/nerdcommenter' " For commenting out codes
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-fugitive' " Git integration
Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'} " PowerLine for status bar
Plug 'Valloric/YouCompleteMe', { 'do': '.vim/plugged/YouCompleteMe/install.py --clang-completer --system-libclang' }
"Plug 'kien/ctrlp.vim' " Searching for files
call plug#end()

let g:deoplete#enable_at_startup = 1 " Setting up vim to auto complete


" Required, explicitly enable linters
let g:ale_linters = {
\   'elixir': ['elixir-ls', 'dialyxir', 'credo', 'dogma'],
\   'go': ['gofmt', 'golint', 'go vet'],
\   'hack': ['hack'],
\   'help': [],
\   'perl': ['perlcritic'],
\   'perl6': [],
\   'python': ['flake8','mypy','pyls', 'pylint', 'bandit'],
\   'rust': ['cargo', 'rls'],
\   'spec': [],
\   'text': [],
\   'javascript': ['eslint', 'vls'],
\   'zsh': ['shell'],
\}

let g:ale_fixers = {
\   'elixir': ['mix_format'],
\   'python': ['autopep8', 'isort', 'yapf']
\}

" Required, tell ALE where to find Elixir LS
let g:ale_elixir_elixir_ls_release=$HOME.'/elixir-ls/release'

" Optional, you can diable dialyzer with the this setting 
let g:ale_elixir_elixir_ls_config={'elixirLS': {'dialyzerEnabled': v:false}}

" Optional, configure as-you-type completions
let g:ale_completion_enabled = 1
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_lint_on_text_changed = 1
let g:ale_fix_on_save = 1

" Setting up numbering the lines
:set nu

" Setting up theme for the vim 
set background=dark
colorscheme palenight

" Setting up true color for vim
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

" Setting update time for Gitchanges
set updatetime=500

"Screen split
set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

"Copying to clipboard
set clipboard=unnamedplus

" NerdTree Settings
nmap <C-f> :NERDTreeToggle<CR>
