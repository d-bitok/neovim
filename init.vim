autocmd!
scriptencoding UTF-8
if !1 | finish | endif
set nocompatible
syntax enable   

:set number
" :set relativenumber
:set autoindent
:set background=dark
:set tabstop=2
:set shiftwidth=2
set ai 
set si 
set nowrap
set backspace=start,eol,indent
set path+=**
set wildignore+=*node_modules*
autocmd Insertleave * set nopaste
set formatoptions+=r 
set cursorline
:set smarttab
:set softtabstop=4
:set mouse=a
" set fileencodings=utf-8, sjis, euc-jp, latin
set title
set nobackup
set hlsearch
set showcmd
set cmdheight=1
set laststatus=2
set scrolloff=10
set expandtab
set shell=zsh
set backupskip=/tmp/*,/private/tmp/*

if has("nvim")
    set inccommand=split
endif
set t_BE=

set nosc noru nosm
set lazyredraw
set ignorecase
filetype plugin indent on 

highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40

highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul 
  autocmd WinLeave * set nocul
augroup END 

if &term =~ "screen"
  autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
  autocmd VinLeave * silent! exe '!echo -n "\ek[`hostname`;`basenane $PWD`]\e\\"'
endif

au BufnewFile,BufRead *.es6 setf javascript
au BufnewFile,BufRead *.tsx setf typescriptreact
au BufnewFile,BufRead *.md set filetype=markdown 
au BufnewFile,BufRead *.mdx set filetype=markdown 
au BufnewFile,BufRead *.flow set filetype=javascript
au BufnewFile,BufRead *.fish set filetype=fish 

set suffixesadd=.js,es,.jsx,.json,.css,.less,.sass,.styl,.php,.md

autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

call plug#begin()

Plug 'https://github.com/peitalin/vim-jsx-typescript'
Plug 'https://github.com/styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'https://github.com/jparise/vim-graphql'
Plug 'https://github.com/junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'https://github.com/terryma/vim-multiple-cursors'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/groenewege/vim-less', { 'for': 'less' }
Plug 'https://github.com/kchmck/vim-coffee-script', { 'for': 'coffee' }
" Plug 'https://github.com/SirVer/ultisnips'
Plug 'https://github.com/mlaursen/vim-react-snippets'
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/windwp/nvim-autopairs'
Plug 'https://github.com/pangloss/vim-javascript'
Plug 'https://github.com/leafgarland/typescript-vim'
Plug 'https://github.com/maxmellon/vim-jsx-pretty'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'https://github.com/neovim/nvim-lspconfig'
Plug 'https://github.com/glepnir/lspsaga.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-lua/completion-nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'mattn/emmet-vim'

call plug#end()

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

set encoding=UTF-8

map <C-t> :call NERDTreeToggleAndRefresh()<CR>

function NERDTreeToggleAndRefresh()
  :NERDTreeToggle
  if g:NERDTree.IsOpen()
    :NERDTreeRefreshRoot
  endif
endfunction

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>
nnoremap <C-p> :tabnext<CR>
nnoremap <C-m> :tabnew<CR>
nnoremap <C-s> :w<CR>
nnoremap <C-w> :wq<CR>
nnoremap <C-q> :q<CR>
nnoremap <C-b> :!touch
nnoremap <C-c> :!mkdir

nmap <F2> :vsplit<CR>
nmap <F1> :split<CR>
nmap <F8> :TagbarToggle<CR>

let g:user_emmet_leader_key='<C-z>'

:set completeopt-=preview " For No Previews

" :colorscheme jellybeans
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
let g:deoplete#enable_at_startup = 1

nnoremap <silent> K :call CocAction('doHover')<CR>
function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gr <Plug>(coc-references)
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)
" nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
" nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
" nmap <leader>do <Plug>(coc-codeaction)
" nmap <leader>rn <Plug>(coc-rename)

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE

" air-line
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

" runtime ./plug.vim
runtime ./maps.vim

if exists("&termguicolors") && exists("&winblend")
  syntax enable
  set termguicolors
  set winblend=0 
  set wildoptions=pum 
  set pumblend=5 
  set background=dark
  let g:neosolarized_termtrans=1
  runtime ./colors/NeoSolarized.vim
  colorscheme NeoSolarized
endif

set exrc

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
