set number "行番号表示
set title "ファイル名の表示
set clipboard=unnamedplus "yでコピーした時にクリップボードに入る
set belloff=all "ビープなし
colorscheme molokai "色の変更 
set ignorecase "検索時に大文字小文字を区別しない
set mouse+=a
set expandtab
set tabstop=8
set shiftwidth=8
set nobackup
set noswapfile
set matchtime=1
nnoremap <silent><C-e> :NERDTreeToggle<CR>
inoremap <silent> jj <ESC>
set backspace=indent,eol,start
cmap w!! w !sudo tee > /dev/null %
hi Visual ctermbg=240 guibg=#979dba 
hi Comment ctermfg=darkgray

call plug#begin('~/.config/nvim/plugged')
    Plug 'https://github.com/vim-airline/vim-airline'
    Plug 'https://github.com/sheerun/vim-polyglot'
    Plug 'https://github.com/github/copilot.vim'
    Plug 'https://github.com/tpope/vim-fugitive'
    Plug 'https://github.com/preservim/nerdtree'
    Plug 'https://github.com/ervandew/supertab'
    Plug 'https://github.com/jiangmiao/auto-pairs'
    Plug 'https://github.com/terryma/vim-expand-region'
    Plug 'https://github.com/mattn/vim-sonictemplate'
    Plug 'https://github.com/Shougo/ddc.vim'
    Plug 'https://github.com/mattn/emmet-vim'
    Plug 'https://github.com/tpope/vim-commentary'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'https://github.com/tomasr/molokai',{'do':'cp colors/* ~/.config/nvim/colora'} 
call plug#end() 
