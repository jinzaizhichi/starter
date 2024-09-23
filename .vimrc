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
set showmode
set laststatus=2
set cmdheight=2
set scrolloff=3
set backspace=2
set noerrorbells
set novisualbell 

set termguicolors
colorscheme tokyonight
set background=dark
set history=1000

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
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim',{'branch':'release'}
Plug 'stevearc/conform.nvim'

call plug#end()

