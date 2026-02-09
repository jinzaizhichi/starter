return {

  -- These are some examples, uncomment them if you want to see them work!

  {
    'williamboman/mason.nvim',
    -- opts = {
    -- ensure_installed = {
    --   "lua-language-server",
    --   "javascript-language-server",
    --   "stylua",
    --   "html-lsp",
    --   "css-lsp",
    --   "prettier",
    --   "black",
    --   "debugpy",
    --   "mypy",
    --   "ruff",
    --   "pyright",
    -- },
    -- },
  },
  {
    'stevearc/conform.nvim',
    event = 'BufWritePre', -- uncomment for format on save
    opts = require('configs.conform'),
  },
  { 'zapling/mason-conform.nvim' },
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      ensure_installed = {
        'vim',
        'lua',
        'vimdoc',
        'html',
        'css',
      },
    },
  },
  -- {
  --   "max397574/better-escape.nvim",
  --   event = "InsertEnter",
  --   config
  --   config = function()
  --     require("better-escape").setup()
  --   end,
  -- },
  {
    'wakatime/vim-wakatime',
    event = 'VeryLazy',
  },
  {

    'JuanZoran/Trans.nvim',
    build = function()
      require('Trans').install()
    end,
    keys = {
      -- 可以换成其他你想映射的键
      { 'mm', mode = { 'n', 'x' }, '<Cmd>Translate<CR>', desc = ' Translate' },
      { 'mk', mode = { 'n', 'x' }, '<Cmd>TransPlay<CR>', desc = ' Auto Play' },
      -- 目前这个功能的视窗还没有做好，可以在配置里将view.i改成hover
      { 'mi', '<Cmd>TranslateInput<CR>', desc = ' Translate From Input' },
    },
    dependencies = { 'kkharji/sqlite.lua' },
    opts = {
      -- your configuration there
    },
  },
  {
    -- 'tpope/vim-surround',
    -- version = "å*", -- Use for stability; omit to use `main` branch for the latest features
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup()
    end,
  },
  {
    'tpope/vim-repeat',
  },
  {
    'jinzaizhichi/MeteorNvim',
  },
  -- lightspeed.nvim
  -- {
  --   "ggandor/lightspeed.nvim",
  --   event = "VimEnter",
  -- },
  -- {
  --   "neovim/nvim-lspconfig",
  --   config = function()
  --     require("nvchad.configs.lspconfig").defaults()
  --     require "configs.lspconfig"
  --   end,
  -- },
  --
  -- {
  -- 	"williamboman/mason.nvim",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"lua-language-server", "stylua",
  -- 			"html-lsp", "css-lsp" , "prettier"
  -- 		},
  -- 	},
  -- },
  --
  {
    'neovim/nvim-lspconfig',
    config = function()
      require('configs.lspconfig')
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  --   'github/copilot.vim',
  --   event = 'VeryLazy',
  -- },
  { import = 'nvchad.blink.lazyspec' },
  {
    'Saghen/blink.cmp',
    opts = require('configs.blink'),
  },
  -- {
  --   -- Gemini CLI 插件
  --   'kiddos/gemini.nvim',
  --   opts = {
  --     model = 'gemini-1.5-flash',
  --   },
  -- },
  {
    'jinzaizhichi/ChatGPT.nvim',
    event = 'VeryLazy',
    config = function()
      require('chatgpt').setup({
        api_host_cmd = 'pass 2dapi/hostname',
        api_key_cmd = 'pass 2dapi/token',
      })
    end,
    dependencies = {
      'MunifTanjim/nui.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
  },
  -- {
  --   'esmuellert/vscode-diff.nvim',
  --   dependencies = { 'MunifTanjim/nui.nvim' },
  --   event = 'VeryLazy',
  --   config = function()
  --     require('vscode-diff').setup({
  --       -- Highlight configuration
  --       highlights = {
  --         -- Line-level: accepts highlight group names or hex colors (e.g., "#2ea043")
  --         line_insert = 'DiffAdd', -- Line-level insertions
  --         line_delete = 'DiffDelete', -- Line-level deletions
  --
  --         -- Character-level: accepts highlight group names or hex colors
  --         -- If specified, these override char_brightness calculation
  --         char_insert = nil, -- Character-level insertions (nil = auto-derive)
  --         char_delete = nil, -- Character-level deletions (nil = auto-derive)
  --
  --         -- Brightness multiplier (only used when char_insert/char_delete are nil)
  --         -- nil = auto-detect based on background (1.4 for dark, 0.92 for light)
  --         char_brightness = nil, -- Auto-adjust based on your colorscheme
  --       },
  --
  --       -- Diff view behavior
  --       diff = {
  --         disable_inlay_hints = true, -- Disable inlay hints in diff windows for cleaner view
  --         max_computation_time_ms = 5000, -- Maximum time for diff computation (VSCode default)
  --       },
  --
  --       -- Keymaps in diff view
  --       keymaps = {
  --         view = {
  --           next_hunk = ']c', -- Jump to next change
  --           prev_hunk = '[c', -- Jump to previous change
  --           next_file = ']f', -- Next file in explorer mode
  --           prev_file = '[f', -- Previous file in explorer mode
  --         },
  --         explorer = {
  --           select = '<CR>', -- Open diff for selected file
  --           hover = 'K', -- Show file diff preview
  --           refresh = 'R', -- Refresh git status
  --         },
  --       },
  --     })
  --   end,
  -- },
}
