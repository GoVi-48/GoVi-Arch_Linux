set viminfo+=n~/.vim/.viminfo

syntax on

set directory=~/.temp/vim
set shortmess+=F
set title
set titlestring=%F
set number
set mouse=a
set ttymouse=xterm2
set clipboard+=unnamedplus

cmap º <C-C>
imap º <Esc>
nmap W :w!<CR> 
nmap Q :q!<CR>
       
let g:airline_theme='one'

au VimLeave * :!clear
