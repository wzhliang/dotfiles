" Vimrc file, http://phuzz.org

set nocompatible    " use vim defaults
set ls=2            " allways show status line
set tabstop=4       " numbers of spaces of tab character
set shiftwidth=4    " numbers of spaces to (auto)indent
set scrolloff=3     " keep 3 lines when scrolling
set showcmd         " display incomplete commands
set hlsearch        " highlight searches
set incsearch       " do incremental searching
set ruler           " show the cursor position all the time
set visualbell t_vb=    " turn off error beep/flash
set novisualbell    " turn off visual bell
set nobackup        " do not keep a backup file
set number          " show line numbers
set smartcase       " ignore case when searching
"set noignorecase   " don't ignore case
set title           " show title in console title bar
set ttyfast         " smoother changes
"set ttyscroll=0        " turn off scrolling, didn't work well with PuTTY
set modeline        " last lines in document sets vim mode
set modelines=3     " number lines checked for modelines
set shortmess=atI   " Abbreviate messages
set nostartofline   " don't jump to first character when paging
set whichwrap=b,s,h,l,<,>,[,]   " move freely between files
set backspace=indent,eol,start
"set viminfo='20,<50,s10,h

set autoindent     " always set autoindenting on
if has('gui')
	set diffopt+=vertical
endif
set nobomb
set foldmethod=indent
set foldlevel=999
set smartindent        " smart indent
"set cindent            " cindent
"set noautoindent
"set smartindent
"set nocindent  

"set autowrite     " auto saves changes when quitting and swiching buffer
set expandtab      " tabs are converted to spaces, use only when required
set showmatch      " show matching braces, somewhat annoying...
set matchtime=0    " no annoying jumping for show match 
"set nowrap         " don't wrap lines
set relativenumber

set rtp^=~/.vim
set rtp+=/usr/local/opt/fzf
filetype plugin on

syntax on           " syntax highlighing
set background=dark        " adapt colors for background

if has("autocmd")
    " Restore cursor position
    au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

    " Filetypes (au = autocmd)
    au FileType helpfile set nonumber      " no line numbers when viewing help
    au FileType helpfile nnoremap <buffer><cr> <c-]>   " Enter selects subject
    au FileType helpfile nnoremap <buffer><bs> <c-T>   " Backspace to go back
    
    " When using mutt, text width=72
    au FileType mail,tex setlocal textwidth=72
    au FileType cpp,c,java,sh,pl,php,asp  setlocal autoindent
    au FileType cpp,c,java,sh,pl,php,asp  setlocal smartindent
    au FileType cpp,c,java,sh,pl,php,asp  setlocal cindent
    au FileType markdown setlocal expandtab
    au FileType markdown setlocal tabstop=4
    au FileType markdown setlocal shiftwidth=4
    au FileType markdown setlocal makeprg=open\ %
    au FileType markdown setlocal nowrap
    au FileType markdown setlocal nosmartindent
    au FileType markdown setlocal nocindent
    au FileType markdown setlocal noautoindent
    au FileType rst setlocal makeprg=restview\ %
    au FileType javascript,xml,html,jade setlocal textwidth=999
    au FileType javascript,xml,html,jade setlocal tabstop=2
    au FileType javascript,xml,html,jade setlocal shiftwidth=2
    au FileType javascript,xml,html,jade setlocal expandtab

    " File formats
    au BufNewFile,BufRead  *.pls    set syntax=dosini
    au BufNewFile,BufRead  modprobe.conf    set syntax=modconf
endif

com! CD lcd %:p:h
" Keyboard mappings
map <silent> <C-N> :silent noh<CR> " turn off highlighted search
"map ,v :sp ~/.vimrc<cr> " edit my .vimrc file in a split
"map ,e :e ~/.vimrc<cr>      " edit my .vimrc file
"map ,u :source ~/.vimrc<cr> " update the system settings from my vimrc file
"----- write out html file
"map ,h :source $VIM/vim71/syntax/2html.vim<cr>:w<cr>:clo<cr>


iab pdb import pdb; pdb.set_trace()
iab ndb from nose.tools import set_trace; set_trace()
iab idb from ipdb import set_trace; set_trace()
cab ow e ~/Dropbox/wiki/

behave xterm
set hidden
set cmdheight=2
"nnoremap <F8> :Tlist<CR>      " map F2 to open next buffer
nnoremap <F2> :w<CR>
nnoremap <F3> :grep -w <C-R><C-W>
nnoremap <F4> :Unite buffer<CR>
nnoremap <F5> :Files<CR>
nnoremap <F6> :set invlist<CR>
nnoremap <F8> :TagbarToggle<CR>
if has('mac')
    nmap <PageDown> :cnext<CR>  " fn + Down
    nmap <PageUp> :cprev<CR>    " fn + Up
else
    nmap <C-Down> :cnext<CR>
    nmap <C-Up> :cprev<CR>
endif
nnoremap <F9> :make<CR>
imap <M-Tab> <ESC>>>A

so $HOME/.vim/project.vim

set lcs=tab:^-,trail:-
nmap <C-Enter> :cs f s <C-R><C-W><CR>
nmap <C-rightmouse> <C-t>
set cscopequickfix=s-,g-,d-,c-,t-,e-,i-
set nowrap
au BufEnter *.[ch] setlocal cin
au BufEnter Dockerfile.* set ft=dockerfile

"pylint plugin
au FileType python compiler pylint
let g:pylint_onwrite = 0

let Tlist_Show_One_File = 1


nmap <F12> :botright cwindow<CR>
nmap <C-F12> :cclose<CR>


let mapleader = ","
nnoremap <F7> :Amarks<CR>
imap &75 <img src="" width="75%"><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

command! -nargs=1 -complete=customlist,MyBookMark W :lcd <args>

fun! MyBookMark(A,L,P)
	return split("/Users/wliang/Dropbox/wiki /Users/wliang/Dropbox/wise")
endfun

command! -nargs=1 -complete=customlist,MyFavourite E :e <args>

fun! MyFavourite(A,L,P)
	let lst = [
                    \ "/Users/wliang/Dropbox/wise/deps.txt",
                    \ "/Users/wliang/.vimrc",
                    \ "/Users/wliang/.zshrc",
                    \ "/Users/wliang/Dropbox/wise/feat.md"
                    \ ]
	return lst
endfun

set grepprg=ag\ --vimgrep\ $*
set grepformat=%f:%l:%c:%m
nmap <Leader>S :SyntasticToggleMode<CR>

let g:pyflakes_use_quickfix = 0
call pathogen#infect()

set listchars=tab:»\ ,trail:·
let g:cssColorVimDoNotMessMyUpdatetime = 1

let g:tagbar_sort=0
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }

let g:go_fmt_command="goimports"

" settings for syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_checkers=['']
let g:rooter_patterns = ['venv', '.git/']

autocmd BufReadPost * :Rooter
set completeopt+=menuone
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#complete_method = "complete"

let g:ale_sign_column_always = 1

if has('mac')
    nmap <D-left> :tabprevious<CR>
    nmap <D-right> :tabnext<CR>
endif
color Mustang

let g:python3_host_prog="/usr/local/bin/python3"

" vim-go
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" vim-markdown
let g:vim_markdown_folding_style_pythonic = 1

