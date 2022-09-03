set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc  " to sorta use nvim and vim at the same tieee


" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
" Plug 'junegunn/fzf.vim'
Plug 'will133/vim-dirdiff'
" following 2 works together
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" Plug 'gabrielelana/vim-markdown'
Plug 'masukomi/vim-markdown-folding'
Plug 'airblade/vim-rooter'
Plug 'vim-scripts/vcscommand.vim'
Plug 'wzhliang/ttfzoom.vim'
" Plug 'bling/vim-airline'
Plug 'skammer/vim-css-color'
" Plug 'ervandew/supertab'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'majutsushi/tagbar'  " strange
"Plug 'machakann/vim-sandwich'
Plug 'yianwillis/vimcdoc'
Plug 'zivyangll/git-blame.vim'
Plug 'nvim-lua/plenary.nvim'  "lua library
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'junegunn/gv.vim'  " git commit browser
Plug 'tpope/vim-fugitive'
Plug 'mzlogin/vim-markdown-toc'
Plug 'neomake/neomake'

" Themes
Plug 'sonph/onehalf'
Plug 'itchyny/landscape.vim'
Plug 'ParamagicDev/vim-medic_chalk'
"Plug 'kaicataldo/material.vim'
Plug 'Gavinok/SpaceWay.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'vim-scripts/sonoma.vim'
Plug 'ray-x/starry.nvim'
Plug 'folke/tokyonight.nvim'


" Plug 'atahabaki/archman-vim'
" Plug 'junegunn/seoul256.vim'

" essential stuff
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" Plug 'williamboman/mason.nvim'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()


exe 'luafile ' . stdpath('config') . '/lsp.lua'

set completeopt=menu,menuone,noselect
exe 'luafile '.  stdpath('config') . '/cmp.lua'


" Telescope Using Lua functions
nnoremap <F5>       <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
n
