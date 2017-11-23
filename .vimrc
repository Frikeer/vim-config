:set invnumber
"Set colorscheme
"set t_Co=256



"Basic keymappings
"Runs python
:nnoremap <silent> <F9> :!clear;python %<CR>
"Maps folds to spacebar
:nnoremap <space> za
"ADds/removes numbers
:nmap <C-N><C-N> :set invnumber<CR>
"Remaps esc to jj
:imap jj <Esc>
"Set inc search
:set incsearch

"Plugin handler
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
"Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/syntastic'
Plug 'nvie/vim-flake8'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
"Plug 'notpratheek/Pychimp-vim'
call plug#end()

"Make code look pretty
let python_highlight_all=1
syntax on

"Code folding
:set foldmethod=indent
:set foldlevel=99


"Set proper PEP8 indents, tabs, etc
highlight BadWhitespace ctermbg=red guibg=darkred
au BufNewFile,BufRead *.py set textwidth=79
"au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.py set fileformat=unix
au BufNewFile,BufRead *.py set encoding=utf-8
au BufNewFile,BufRead *.py match BadWhitespace /\s\+$/ "Marks bad whitespace
au BufNewFile,BufRead *.py set colorcolumn=79
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set tabstop=4
"au BufNewFile,BufRead *.py setlocal foldmethod=indent
au BufNewFile,BufRead *.py vmap <CR> :s/\(^\s*\)/\1# /<CR>:let @/ = ""<CR>
au BufNewFile,BufRead *.py vmap <S-CR> :s/\(^\s*\)# /\1/<CR>:let @/ = ""<CR>
"au BufNewFile,BufRead *.py colorscheme pychimp 


"For SQL
"autocmd bufnewfile *.sql so ~/.vim/skeleton.sql
autocmd bufnewfile *.sql exe "g/\%filename\%/s//" .expand("%")
autocmd bufnewfile *.sql exe "g/\%data\%/s//" .strftime("%y-%m-%d")

autocmd Bufwritepre,filewritepre *.sql execute "normal ma"
autocmd Bufwritepre,filewritepre *.sql exe "g/$LastModified:/s/\$LastModified:.*/$LastModified: " .strftime("%c")
autocmd bufwritepost,filewritepost *.sql execute "normal `a"
autocmd BufNewFile *.sql 0put ='REM vim: set sw=2 sts=2 et tw=80 :' |
        \ set sw=2 sts=2 et tw=80 |
	\ norm G

autocmd FileType sql setlocal sw=2 sts=2 et tw=80 ai
