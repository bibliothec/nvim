set number "行番号表示
set title "ファイル名の表示
set clipboard=unnamedplus "yでコピーした時にクリップボードに入る
set belloff=all "ビープなし
colorscheme molokai "色の変更 
set ignorecase "検索時に大文字小文字を区別しない
set mouse+=a "マウス有効化
set expandtab
set tabstop=8
set shiftwidth=8
set nobackup "バックアップなし
set noswapfile  "swapなし
set matchtime=1
set imdisable 
set history=1000
set wrapscan "最後尾まで検索を終えたら次の検索で先頭に移る
set gdefault "置換の時 g オプションをデフォルトで有効にする
let loaded_matchparen = 1 "括弧ハイライト削除
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
nnoremap <silent><C-e> :NERDTreeToggle<CR>
inoremap <silent> jj <ESC>
nnoremap あ a
nnoremap い i
nnoremap う u
nnoremap お o
nnoremap っd dd
nnoremap っy yy
nnoremap し” ci"
nnoremap し’ ci'
noremap ア a
noremap イ i
noremap ウ u
noremap エ e
noremap オ o
noremap ａ a
noremap ｂ b
noremap ｃ c
noremap ｄ d
noremap ｅ e
noremap ｆ f
noremap ｇ g
noremap ｈ h
noremap ｉ i
noremap ｊ j
noremap ｋ k
noremap ｌ l
noremap ｍ m
noremap ｎ n
noremap ｏ o
noremap ｐ p
noremap ｑ q
noremap ｒ r
noremap ｓ s
noremap ｔ t
noremap ｕ u
noremap ｖ v
noremap ｗ w
noremap ｘ x
noremap ｙ y
noremap ｚ z
noremap <S-h> ^     "S-hで左端へ
noremap <S-l> $     "S-lで右端へ
nnoremap == gg=G    "=を二回連続入力でバッファ全体をインデント整理
inoremap <C-c> <Esc>    "Esc押しづらいので入れておく
let g:AutoPairsMapCh=0 "これはautpairsによりC-hがBSにならないようにするもの
set backspace=indent,eol,start "windowsに対応
"cmap w!! w !sudo tee > /dev/null %　"管理者で保存する際に使用可
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:% "eol:↲,

hi Visual ctermbg=30 guibg=#00ffff "ヴィジュアルモードの色変更
hi Comment ctermfg=214  "コメントの色変更
highlight Normal ctermbg=none  "背景等を透明に
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none 
highlight LineNr ctermfg=247  "行番号の色変更
hi Delimiter guifg=#e6e6fa ctermfg=250 "()の色とか
highlight SpecialKey ctermbg=NONE guibg=NONE ctermfg=250
highlight NonText ctermbg=none ctermfg=226 "改行の色とか
highlight Number ctermfg=141 "数の色とか
highlight Boolean ctermfg=141
highlight Float ctermfg=141


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
    Plug 'rust-lang/rust.vim'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'
    call plug#end()
