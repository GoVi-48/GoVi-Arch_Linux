set viminfo+=n~/.config/nvim/.nviminfo
autocmd BufRead,BufNewFile * start

syntax on

set directory=~/.temp/nvim
set shortmess+=F
set title
set titlestring=%F
set number
set mouse=a
set clipboard+=unnamedplus
set guicursor+=n-v-c:blinkon0

cmap º <C-C>
imap º <Esc>
nmap 1 <Esc>i
nmap <C-A> gg
nmap <C-E> G
nmap C :+c<CR>
nmap c :+y<CR>
nmap v :+p<CR>
nmap W :w!<CR>
nmap Q :q!<CR>

let g:airline_theme='one'