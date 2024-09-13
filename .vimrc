set nocompatible
set nu
set relativenumber 
syntax on
set encoding=UTF-8
set smarttab
set smartindent
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set re=0
set nowrap
set noswapfile
set incsearch
set scrolloff=8
set guicursor=
set showcmd
set noerrorbells
set novisualbell 
set t_vb=

set termguicolors
colorscheme tokyonight
set background=dark

let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1
let g:tokyonight_transparent_background = 1
set ruler



call plug#begin()

Plug 'preservim/nerdtree' 
Plug 'preservim/nerdcommenter' 
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'vim-airline/vim-airline'
Plug 'ghifarit53/tokyonight-vim'
Plug 'Yggdroot/indentLine'
Plug 'yianwillis/vimcdoc'
Plug 'preservim/tagbar'
Plug 'voldikss/vim-floaterm'
Plug 'Yggdroot/LeaderF',{'do':':LeaderfInstallCExtension'}
Plug 'ludovicchabant/vim-gutentags'



call plug#end()

