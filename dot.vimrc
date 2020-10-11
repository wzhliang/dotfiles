" Vimrc file, http://phuzz.org

set nocompatible    " use vim defaults
set ls=2            " allways show status line
set tabstop=4       " numbers of spaces of tab character
set shiftwidth=4    " numbers of spaces to (auto)indent
set scrolloff=3     " keep 3 lines when scrolling
set hidden
set showcmd         " display incomplete commands
set cmdheight=2
set hlsearch        " highlight searches
set incsearch       " do incremental searching
set ruler           " show the cursor position all the time
set visualbell t_vb=    " turn off error beep/flash
set novisualbell    " turn off visual bell
set nobackup        " do not keep a backup file
set number          " show line numbers
set smartcase       " ignore case when searching
set title           " show title in console title bar
set ttyfast         " smoother changes
set modeline        " last lines in document sets vim mode
"set modelines=3     " number lines checked for modelines
"set shortmess=atI   " Abbreviate messages
set nostartofline   " don't jump to first character when paging
set whichwrap=b,s,h,l,<,>,[,]
set backspace=indent,eol,start
set listchars=tab:»\ ,trail:·
set completeopt+=menuone
set updatetime=300
" set signcolumn=number
"set viminfo='20,<50,s10,h

if has('gui')
	set diffopt+=vertical
endif
set nobomb
set foldmethod=indent
set foldlevel=999
set autoindent

"set autowrite     " auto saves changes when quitting and swiching buffer
set expandtab      " tabs are converted to spaces, use only when required
set showmatch
"set matchtime=0    " no annoying jumping for show match 
set nowrap
set relativenumber

set rtp+=/usr/local/opt/fzf
syntax on
filetype plugin on
set background=dark

if has("autocmd")
    " Restore cursor position
    au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

    au FileType helpfile set nonumber      " no line numbers when viewing help
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
    au FileType javascript,xml,html,jade setlocal textwidth=999
    au FileType javascript,xml,html,jade setlocal tabstop=2
    au FileType javascript,xml,html,jade setlocal shiftwidth=2
    au FileType javascript,xml,html,jade setlocal expandtab
    au BufEnter Dockerfile.* set ft=dockerfile
endif

com! CD lcd %:p:h

" Keyboard mappings
map <silent> <C-N> :silent noh<CR> " turn off highlighted search

" Python debugger
iab pdb import pdb; pdb.set_trace()
iab ndb from nose.tools import set_trace; set_trace()
iab idb from ipdb import set_trace; set_trace()

behave xterm

nnoremap <F2> :w<CR>
nnoremap <F3> :grep -w <C-R><C-W>
nnoremap <F4> :Unite buffer<CR>
nnoremap <F5> :Files<CR>
nnoremap <F6> :set invlist<CR>
nnoremap <F7> :Amarks<CR>
nnoremap <F8> :TagbarToggle<CR>
nnoremap <F9> :make<CR>
" override popup menu colors
nnoremap <F10> :hi Pmenu ctermbg=black guibg=black guifg=#CEC850<CR>
nmap <F12> :botright cwindow<CR>
nmap <C-F12> :cclose<CR>
nmap <Space> <C-f>
nmap <S-Space> <C-b>

if has('mac')
    nmap <PageDown> :cnext<CR>  " fn + Down
    nmap <PageUp> :cprev<CR>    " fn + Up
else
    nmap <C-Down> :cnext<CR>
    nmap <C-Up> :cprev<CR>
endif
if has('mac')
    nmap <D-left> :tabprevious<CR>
    nmap <D-right> :tabnext<CR>
endif
" not sure if this is needed
"imap <M-Tab> <ESC>>>A

" so $HOME/.vim/project.vim

color glacier

"pylint plugin
au FileType python compiler pylint
let g:pylint_onwrite = 0

let Tlist_Show_One_File = 1


let mapleader = ","
" for inserting image into markdown
imap &75 <img src="" width="75%"><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
" for inserting link into markdown
imap &L [](<C-o>"+p<ESC>A)<ESC>0f]i

command! -nargs=1 -complete=customlist,MyBookMark W :lcd <args>

fun! MyBookMark(A,L,P)
	return split("/Users/wliang/Dropbox/wiki /Users/wliang/Dropbox/wise")
endfun

command! -nargs=1 -complete=customlist,MyFavourite E :e <args>

fun! MyFavourite(A,L,P)
	let lst = [
                    \ "/Users/wliang/Dropbox/wise/deps.txt",
                    \ "/Users/wliang/Dropbox/wise/youshang.md",
                    \ "/Users/wliang/.vimrc",
                    \ "/Users/wliang/.zshrc",
                    \ "/Users/wliang/Dropbox/wise/feat.md"
                    \ ]
	return lst
endfun

set grepprg=rg\ --vimgrep\ $*
set grepformat=%f:%l:%c:%m

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


let g:rooter_patterns = ['venv', '.git/']
autocmd BufReadPost * :Rooter

"let g:deoplete#enable_at_startup = 1
"let g:deoplete#complete_method = "complete"

let g:python3_host_prog="/usr/local/bin/python3"

" vim-go
let g:go_fmt_command="goimports"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" vim-markdown
let g:vim_markdown_folding_style_pythonic = 1

" override popup menu colors
hi Pmenu ctermbg=black guibg=black guifg=#CEC850<CR>
let g:material_theme_style = 'darker'
let g:SuperTabDefaultCompletionType = "<c-n>"

" GitBlame
nnoremap <Leader>b :<C-u>call gitblame#echo()<CR>

