-- clipboad on
vim.opt.clipboard = "unnamedplus"
-- 表示
-- -番号表示
vim.opt.number = true
-- タイトルの表示
vim.opt.title = true
-- -特殊文字表示
vim.opt.list = true
vim.opt.listchars = {tab='>-', trail='*', nbsp='+'}
-- -エラー時の音を画面表示に
vim.opt.visualbell = true
-- -括弧の連携
vim.opt.showmatch = true
vim.opt.matchtime = 1
-- -ヘルプファイル
vim.opt.helplang = 'ja', 'en'
-- -tabバーの表示
vim.opt.showtabline = 2
-- 入力時
vim.opt.encoding = "utf-8"
-- -インデントをC言語風に
vim.opt.autoindent = true
vim.opt.smartindent = true
-- -タブ文字
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
-- カーソルラインをハイライト
vim.opt.cursorline = true
-- 検索
-- -大文字無視
vim.opt.ignorecase = true
-- -大文字で検索したら区別をつける
vim.opt.smartcase = true
-- -検索が末尾までいったら先頭から検索
vim.opt.wrapscan = true
-- カーソル移動
-- - 行を跨いでの移動
 vim.opt.whichwrap = 'b', 's', 'h', 'l', '<', '>', '[', ']'

-- - 削除時の対象(windows)(バグる)
-- vim.opt.backspace = 'start', 'eol', 'indent'

-- ファイル環境
-- -フォーマット
vim.opt.fileformats =  'unix', 'dos', 'mac'
-- マウス有効
vim.opt.mouse = 'a'
-- East Asian Ambigous Width
vim.opt.ambiwidth = "single"
-- タブでファイル名補完
vim.opt.wildmenu = true
-- ステータス領域を通常時に表示するか
vim.opt.cmdheight = 1
-- ステータス領域を常に表示するか
vim.opt.laststatus = 3
vim.opt.showcmd = true
vim.opt.hlsearch = true
vim.opt.hidden = true
-- backupファイルを作成するか
vim.opt.backup = false
-- backupファイルの場所
vim.opt.backupdir = os.getenv("HOME") .. '/.vim/backup'
-- 後ろの文字を透過してくれる
vim.opt.winblend = 20
vim.opt.pumblend = 20
vim.opt.termguicolors = true

vim.opt.wrap = false
vim.opt.nrformats = "bin,hex"
-- スワップファイルなし
vim.opt.swapfile = false
-- ファイルが他で変更されている場合に自動的に読み直し
vim.opt.autoread = true
vim.opt.formatoptions:remove('t')
vim.opt.formatoptions:append('mM')
-- vim.keymap.set(mode, lhs, rhs, options)
-- set s key to Window moving.
vim.keymap.set('n', 's', '<NOP>')
-- set s+hjkl move to other window
vim.keymap.set('n', 'sj', '<C-w>j')
vim.keymap.set('n', 'sk', '<C-w>k')
vim.keymap.set('n', 'sl', '<C-w>l')
vim.keymap.set('n', 'sh', '<C-w>h')
-- set s+sv separate window
vim.keymap.set('n', 'ss', '<C-w>s')
vim.keymap.set('n', 'sv', '<C-w>v')
-- set s+nptT move tab
vim.keymap.set('n', 'sn', 'gt')
vim.keymap.set('n', 'sp', 'gT')
vim.keymap.set('n', 'st', ':<C-u>tabnew<CR>')
-- set s+qQ kill buffer or close window
vim.keymap.set('n', 'sq', ':<C-u>q<CR>')
vim.keymap.set('n', 'sb', ':<C-u>bd!<CR>')
-- set ESC+ESC Clear Search hilight
vim.keymap.set('n', '<ESC><ESC>', ':<C-u>set nohlsearch!<CR>')
-- move ctrl+hjkl
vim.keymap.set('i', '<C-h>', '<Left>')
vim.keymap.set('i', '<C-j>', '<Down>')
vim.keymap.set('i', '<C-k>', '<Up>')
vim.keymap.set('i', '<C-l>', '<Right>')
-- jjでescに
vim.keymap.set('i', 'jj', '<ESC>')
vim.keymap.set('i', '<C-c>', '<ESC>')
-- xで削除した時にコピーしない
vim.keymap.set('n', 'x', '"_x')
-- shift+hlで飛ばして移動
vim.keymap.set('n', '<S-h>', '^')
vim.keymap.set('n', '<S-l>', '$')
-- カラースキーム(colorsのところに置いておく)
vim.cmd 'colorscheme alduin'

 vim.api.nvim_create_autocmd({ 'TermOpen' }, {
   pattern = '*',
   command = 'startinsert',
 })
-- eqaul to below setting
vim.cmd 'autocmd TermOpen * startinsert'


-- ファイルを開いた時に、カーソルの場所を復元する
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    pattern = { "*" },
    callback = function()
        vim.api.nvim_exec('silent! normal! g`"zv', false)
    end,
})

-- 入力メソッドの切り替え
 vim.cmd [[
 if executable('fcitx5')
   let g:fcitx_state = 1
   augroup fcitx_savestate
     autocmd!
     autocmd InsertLeave * let g:fcitx_state = str2nr(system('fcitx5-remote'))
     autocmd InsertLeave * call system('fcitx5-remote -c')
     autocmd InsertEnter * call system(g:fcitx_state == 1 ? 'fcitx5-remote -c': 'fcitx5-remote -o')
   augroup END
 endif
 ]]

require("packer").startup(function(use)
    -- powerline
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    -- カッコの補完
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end}
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    use { "nvim-telescope/telescope-file-browser.nvim" }
    use {
      'stevearc/aerial.nvim',
      config = function() require('aerial').setup() end
    }
    use { 'ibhagwan/fzf-lua',
    -- optional for icon support
    requires = { 'kyazdani42/nvim-web-devicons' }
    }
    -- plugin manager
    use("wbthomason/packer.nvim")
    -- scrollbar
    use("petertriho/nvim-scrollbar")
    -- LSP
    use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    }
    -- DAP (Debug Adapter Protocol)
    use 'mfussenegger/nvim-dap'
    -- linters
    -- use 'mfussenegger/nvim-lint'
    -- formatter
    -- use { 'mhartington/formatter.nvim' }
    -- linter & formatter
    use ("jose-elias-alvarez/null-ls.nvim")
    --colorcheme
    use "EdenEast/nightfox.nvim"
    use { "catppuccin/nvim", as = "catppuccin" }
    use 'folke/tokyonight.nvim'
    -- markdown preiew
    use 'ellisonleao/glow.nvim'
    -- emmet
    use 'mattn/emmet-vim'

    use("jparise/vim-graphql")
    use("terrortylor/nvim-comment")
    use("bronson/vim-visual-star-search")
    use("lambdalisue/fern.vim")
    use("acro5piano/nvim-format-buffer")
    -- cmp(<C-n>/<C-p>で候補を探して<CR> (Enter) で選択)
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/cmp-nvim-lsp")
    use("tpope/vim-surround")
    use("dcampos/nvim-snippy")
    use("dcampos/cmp-snippy")
end)

-- plugin setup
-- lualine setup
require('evil_lualine')
require("telescope").load_extension "file_browser"
-- lsp setup
require("mason").setup()
require("mason-lspconfig").setup()
require("lspconfig").clangd.setup {}
require("lspconfig").rust_analyzer.setup {}
require("lspconfig").omnisharp.setup {}
require("lspconfig").gopls.setup {}
require("lspconfig").cmake.setup {}
require("lspconfig").kotlin_language_server.setup {}
require("lspconfig").pyright.setup {}
require("lspconfig").arduino_language_server.setup {}
require("lspconfig").bashls.setup {}
require'lspconfig'.tsserver.setup{}
require("lspconfig").r_language_server.setup {}
require("lspconfig").vimls.setup {}
require("lspconfig").vuels.setup {}
require("lspconfig").powershell_es.setup {}
require("lspconfig").dartls.setup {}
require("lspconfig").denols.setup {}
require("lspconfig").gdscript.setup {}
require("lspconfig").dockerls.setup {}
require("lspconfig").html.setup {}
require("lspconfig").intelephense.setup {}
require("lspconfig").texlab.setup {}
require("lspconfig").jdtls.setup {}
require("lspconfig").perlnavigator.setup {}
require("lspconfig").solargraph.setup {}
require("lspconfig").zls.setup {}
require("lspconfig").serve_d.setup {}
-- require("lspconfig")..setup {}
-- require("lspconfig")..setup {}
-- require("lspconfig")..setup {}
-- require("lspconfig")..setup {}
-- require("lspconfig")..setup {}
-- require("lspconfig")..setup {}

-- 型情報
vim.keymap.set('n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>')
-- format
vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
-- カーソル下の変数をコード内で参照している箇所を一覧表示
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
-- 関数の定義を表示
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
-- 変数名のリネーム
vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
-- Error/Warning/Hintが出ている箇所で実行可能な修正の候補を表示
vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>')


local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.completion.spell,
    },
})

