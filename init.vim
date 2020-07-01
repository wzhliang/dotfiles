set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf.vim'
Plug 'will133/vim-dirdiff'
Plug 'plasticboy/vim-markdown'
Plug 'airblade/vim-rooter'
Plug 'vim-scripts/vcscommand.vim'
Plug 'vim-scripts/sonoma.vim'
Plug 'wzhliang/ttfzoom.vim'
Plug 'Shougo/unite.vim'
" Plug 'bling/vim-airline'
Plug 'posva/vim-vue'
Plug 'skammer/vim-css-color'
Plug 'ervandew/supertab'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/landscape.vim'
Plug 'itchyny/lightline.vim'
Plug 'fatih/vim-go'
Plug 'majutsushi/tagbar'
Plug 'machakann/vim-sandwich'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
