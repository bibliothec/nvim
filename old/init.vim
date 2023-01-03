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
" 削除キーでyankしない
nnoremap x "_x
" nnoremap d "_d
" nnoremap D "_D
set guifont=DejaVu\ Sans\ Mono:h10
nnoremap <ESC><ESC> :nohlsearch<CR>
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
nnoremap <silent><C-e> :NERDTreeToggle<CR>
inoremap <silent> jj <ESC>
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
" use powerline
    Plug 'https://github.com/vim-airline/vim-airline'
" auto color as language
    Plug 'https://github.com/sheerun/vim-polyglot'
" git 
    Plug 'https://github.com/tpope/vim-fugitive'
" filetree
    Plug 'https://github.com/preservim/nerdtree'
" tab complement
    Plug 'https://github.com/ervandew/supertab'
" make pair brackets
    Plug 'https://github.com/jiangmiao/auto-pairs'
" easy to expand visual mode
    Plug 'https://github.com/terryma/vim-expand-region'
" load my template
    Plug 'https://github.com/mattn/vim-sonictemplate'
" can change character size
    Plug 'https://github.com/vim-scripts/zoom.vim'
" preview replace
    Plug 'https://github.com/markonm/traces.vim'
" can use emmet
    Plug 'https://github.com/mattn/emmet-vim'
" easy to comment out
    Plug 'https://github.com/tpope/vim-commentary'
" autocomplement
"   Plug 'neoclide/coc.nvim', {'branch': 'release'}
" color scheme
    Plug 'https://github.com/tomasr/molokai',{'do':'cp colors/* ~/.config/nvim/colora'}
" for rust lang
    Plug 'rust-lang/rust.vim'
" auto complement
    Plug 'https://github.com/Shougo/ddc.vim'
" show language error
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'
    Plug 'neovim/nvim-lspconfig'
    Plug 'Shougo/ddc-nvim-lsp'" 
" DenoでVimプラグインを開発するためのプラグイン
    Plug 'vim-denops/denops.vim'
" ポップアップウィンドウを表示するプラグイン
    Plug 'Shougo/pum.vim'
" カーソル周辺の既出単語を補完するsource
    Plug 'Shougo/ddc-around'
" ファイル名を補完するsource
    Plug 'LumaKernel/ddc-file'
" 入力中の単語を補完の対象にするfilter
    Plug 'Shougo/ddc-matcher_head'
" 補完候補を適切にソートするfilter
    Plug 'Shougo/ddc-sorter_rank'
" 補完候補の重複を防ぐためのfilter
    Plug 'Shougo/ddc-converter_remove_overlap'
" UIの指定
    Plug 'Shougo/ddc-ui-native'
call plug#end()

"nerdtree
" autocmd VimEnter * NERDTree | wincmd p
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"minimap

" dcc.vim setting 
call plug#('Shougo/ddc.vim')
call plug#('vim-denops/denops.vim')
call plug#('Shougo/pum.vim')
call plug#('Shougo/ddc-around')
call plug#('LumaKernel/ddc-file')
call plug#('Shougo/ddc-matcher_head')
call plug#('Shougo/ddc-sorter_rank')
call plug#('Shougo/ddc-converter_remove_overlap')
"call plug#('prabirshrestha/vim-lsp')
"call plug#('mattn/vim-lsp-settings')

call ddc#custom#patch_global('ui', 'native')
call ddc#custom#patch_global('completionMenu', 'pum.vim')
call ddc#custom#patch_global('sources', [
 \ 'around',
 \ 'nvim-lsp',
 \ 'file'
 \ ])
call ddc#custom#patch_global('sourceOptions', {
 \ '_': {
 \   'matchers': ['matcher_head'],
 \   'sorters': ['sorter_rank'],
 \   'converters': ['converter_remove_overlap'],
 \ },
 \ 'around': {'mark': 'Around'},
 \ 'nvim-lsp': {
 \   'mark': 'L', 
 \   'matchers': ['matcher_head'],
 \   'forceCompletionPattern': '\.\w*|:\w*|->\w*'
 \ },
 \ 'file': {
 \   'mark': 'file',
 \   'isVolatile': v:true, 
 \   'forceCompletionPattern': '\S/\S*'
 \ }})
call ddc#enable()
inoremap <Tab> <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
