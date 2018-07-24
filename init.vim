set nocompatible

call plug#begin('~/.local/share/nvim/plugged')

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" The legendary NERDtree!
Plug 'scrooloose/nerdtree'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'ntpeters/vim-better-whitespace'

Plug 'majutsushi/tagbar'

" A fancy start screen, shows MRU etc.
Plug 'mhinz/vim-startify'

" Vim signs (:h signs) for modified lines based off VCS (e.g. Git)
Plug 'mhinz/vim-signify'

" Glorious colorschemes
Plug 'ciaranm/inkpot'
Plug 'nanotech/jellybeans.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'zeis/vim-kolor'
Plug 'vim-scripts/wombat256.vim'
Plug 'jnurmine/Zenburn'
Plug 'Lokaltog/vim-distinguished'
Plug 'goatslacker/mango.vim'

Plug expand('<sfile>:p:h:h:h')

Plug 'tpope/vim-fugitive'

call plug#end()

" Tagbar remap
nmap <F8> :TagbarToggle<CR>

colorscheme jellybeans

set noswapfile
set hidden

" set expandtab
set relativenumber

" Always draw sign column. Prevent buffer moving when adding/deleting sign.
set signcolumn=yes

" Show tabs and trailing whitespace visually
set list listchars=tab:»·,trail:·,extends:…,nbsp:‗

highlight ExtraWhitespace ctermbg=red


let g:deoplete#enable_at_startup = 1

let g:LanguageClient_devel = 1
let g:LanguageClient_loggingLevel = 'DEBUG'
let g:LanguageClient_serverCommands = {
    \ 'c': ['clangd-7'],
    \ 'cpp': ['clangd-7'],
    \ 'python': ['pyls'],
    \ }
let g:LanguageClient_selectionUI = 'location-list'


nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> <Leader>sh :call LanguageClient#textDocument_signatureHelp()<CR>
