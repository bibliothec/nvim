-- clipboad on
vim.opt.clipboard = "unnamedplus"
-- 表示
-- 番号表示
vim.opt.number = true
-- タイトルの表示
vim.opt.title = true
-- 特殊文字表示
vim.opt.list = true
vim.opt.listchars = {tab='>-', trail='*', nbsp='+'}
-- エラー時の音を画面表示に
vim.opt.visualbell = true
-- 括弧の連携
vim.opt.showmatch = true
vim.opt.matchtime = 1
-- ヘルプファイル
vim.opt.helplang = 'ja', 'en'
-- tabバーの表示
vim.opt.showtabline = 2
-- 入力時
vim.opt.encoding = "utf-8"
-- インデントをC言語風に
vim.opt.autoindent = true
vim.opt.smartindent = true
-- タブ文字
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
-- カーソルラインをハイライト
vim.opt.cursorline = true
-- 検索
-- 大文字無視
vim.opt.ignorecase = true
-- 大文字で検索したら区別をつける
vim.opt.smartcase = true
-- 検索が末尾までいったら先頭から検索
vim.opt.wrapscan = true
-- カーソル移動
--  行を跨いでの移動
 vim.opt.whichwrap = 'b', 's', 'h', 'l', '<', '>', '[', ']'
-- 削除時の対象(windows)(バグる)
-- vim.opt.backspace = 'start', 'eol', 'indent'
-- ファイル環境
-- フォーマット
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
--vim.opt.backupdir = os.getenv("HOME") .. '/.vim/backup'
-- 後ろの文字を透過してくれる
-- vim.opt.winblend = 20
-- vim.opt.pumblend = 20
-- vim.opt.termguicolors = true
-- 画面を超えたら行を折り返すかどうか
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
-- dwで削除した時にコピーしない
vim.keymap.set("n", "dw", '"_dw', opts)
-- ;でコマンド入力( ;と:を入れ替)
-- vim.keymap.set("n", ";", ":", opts)
-- 行末までのヤンクにする
vim.keymap.set("n", "Y", "y$", opts)
-- コンマの後に自動的にスペースを挿入
vim.keymap.set("i", ",", ",<Space>", opts)
-- Select all
vim.keymap.set("n", "<C-h>", "gg<S-v>G", opts)
-- shift+hlで飛ばして移動
vim.keymap.set('n', '<Space>h', '^')
vim.keymap.set('n', '<Space>l', '$')
-- ターミナルモードでESC無効
-- vim.keymap.set('t', 'ESC', '')
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

--require('plugins')

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
    -- icons
    use 'kyazdani42/nvim-web-devicons'
    -- terminal
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end}
    -- filemanager
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use { 'ibhagwan/fzf-lua',
    -- optional for icon support
        requires = { 'kyazdani42/nvim-web-devicons' }
    }
    use { "nvim-telescope/telescope-file-browser.nvim" }
    -- overview
    use {
        'stevearc/aerial.nvim',
        config = function() require('aerial').setup() end
    }
    -- シンボル一覧表示
    use 'simrat39/symbols-outline.nvim'
    -- hilight
    use 'nvim-treesitter/nvim-treesitter'
    -- filetree
    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
    use {
      "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = { 
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
          "MunifTanjim/nui.nvim",
        }
      }
    -- window decoration
    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
        local saga = require("lspsaga")
        --[[
        saga.init_lsp_saga({
            -- your configuration
        })
        ]]
        end,
    })
    -- plugin manager
    use("wbthomason/packer.nvim")
    -- scrollbar
    use("petertriho/nvim-scrollbar")
    -- tab manager 
    use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
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
    -- git
    use {
        'lewis6991/gitsigns.nvim',
      -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    }
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
    use("hrsh7th/vim-vsnip")
    use("tpope/vim-surround")
    -- use("dcampos/nvim-snippy")
    use({"L3MON4D3/LuaSnip"})
    -- use("dcampos/cmp-snippy")
end)

-- plugin setup
-- lualine setup
require('evil_lualine')
-- telescope filebrowser add 
require("telescope").load_extension "file_browser"
-- bufferline setup
vim.opt.termguicolors = true
require("bufferline").setup{}
-- symbol-outline setup
require("symbols-outline").setup()
-- luasnipet
require("luasnip.loaders.from_vscode").lazy_load()
-- aerial setup
require('aerial').setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', {buffer = bufnr})
    vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', {buffer = bufnr})
  end
})
-- You probably also want to set a keymap to toggle aerial
vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>')
-- gitsigns setup
require('gitsigns').setup {
  signs = {
    add          = { hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
    change       = { hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
    delete       = { hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
    topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
    changedelete = { hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
    untracked    = { hl = 'GitSignsAdd'   , text = '┆', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
}
-- nvim scrollbars setup
local colors = require("tokyonight.colors").setup()
require("scrollbar").setup({
    handle = {
        color = colors.bg_highlight,
    },
    marks = {
        Search = { color = colors.orange },
        Error = { color = colors.error },
        Warn = { color = colors.warning },
        Info = { color = colors.info },
        Hint = { color = colors.hint },
        Misc = { color = colors.purple },
    }
})

-- lsp setup
require("mason").setup()
require("mason-lspconfig").setup()
-- for C/C++
-- require("lspconfig").clangd.setup {}
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = 'utf-8'
require('lspconfig').clangd.setup{
        capabilities = capabilities
}
-- for rust
require("lspconfig").rust_analyzer.setup {}
-- for c#
require("lspconfig").omnisharp.setup {}
require("lspconfig").csharp_ls.setup {}
-- for D
require("lspconfig").serve_d.setup {}
-- for go
require("lspconfig").gopls.setup {}
-- for Cmake
require("lspconfig").cmake.setup {}
-- for kotlin
require("lspconfig").kotlin_language_server.setup {}
-- for python
require("lspconfig").pyright.setup {}
-- for arduino
require("lspconfig").arduino_language_server.setup {}
-- for bash
require("lspconfig").bashls.setup {}
-- for javascript/typescript
require'lspconfig'.tsserver.setup{}
-- for R
require("lspconfig").r_language_server.setup {}
-- for vimscript
require("lspconfig").vimls.setup {}
-- for vue
require("lspconfig").vuels.setup {}
-- for Powershell
require("lspconfig").powershell_es.setup {}
-- for dart
require("lspconfig").dartls.setup {}
-- for deno
require("lspconfig").denols.setup {}
-- for gdscript
require("lspconfig").gdscript.setup {}
-- for dockrfile
require("lspconfig").dockerls.setup {}
-- for html
require("lspconfig").html.setup {}
-- for PHP
require("lspconfig").intelephense.setup {}
-- fot tex
require("lspconfig").texlab.setup {}
-- for Java need later jdk
require("lspconfig").jdtls.setup {}
-- perl
require("lspconfig").perlnavigator.setup {}
-- ruby
require("lspconfig").solargraph.setup {}
-- for zig
require("lspconfig").zls.setup {}
-- for tailwindcss
require("lspconfig").tailwindcss.setup {}
-- for css
require("lspconfig").cssls.setup {}
-- require("lspconfig")..setup {}
-- require("lspconfig")..setup {}
-- require("lspconfig")..setup {}

-- lspのキーマップ
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
-- vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
-- 変数名のリネーム
vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
-- Error/Warning/Hintが出ている箇所で実行可能な修正の候補を表示
vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>')

-- toggletermのキーマップ
vim.keymap.set('n', '<C-t>', '<cmd>ToggleTerm<CR>', {buffer = bufnr})
vim.keymap.set('i', '<C-t>', '<cmd>ToggleTerm<CR>', {buffer = bufnr})
vim.keymap.set('t', '<C-t>', '<cmd>exit<CR>', {buffer = bufnr})

-- telescopeのキーマップ
vim.keymap.set('n', 'ff', '<cmd>Telescope file_browser<CR>', {buffer = bufnr})


-- null-ls
local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.completion.spell,
    },
})


-- nvim-cmp setup
  local cmp = require'cmp'
  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })
-- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })




