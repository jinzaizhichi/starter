return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
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
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
      },
    },
  },
  -- {
  --   "max397574/better-escape.nvim",
  --   event = "InsertEnter",
  --   config = function()
  --     require("better-escape").setup()
  --   end,
  -- },
  {
    "wakatime/vim-wakatime",
    event = "VeryLazy",
  },
  {

    "JuanZoran/Trans.nvim",
    build = function()
      require("Trans").install()
    end,
    keys = {
      -- 可以换成其他你想映射的键
      { "mm", mode = { "n", "x" }, "<Cmd>Translate<CR>", desc = " Translate" },
      { "mk", mode = { "n", "x" }, "<Cmd>TransPlay<CR>", desc = " Auto Play" },
      -- 目前这个功能的视窗还没有做好，可以在配置里将view.i改成hover
      { "mi", "<Cmd>TranslateInput<CR>", desc = " Translate From Input" },
    },
    dependencies = { "kkharji/sqlite.lua" },
    opts = {
      -- your configuration there
    },
  },
  {
    "tpope/vim-surround",
    -- version = "å*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    -- config = function()
    --   require("nvim-surround").setup {}
    -- end,
  },
  {
    "tpope/vim-repeat",
  },
  {
    "jinzaizhichi/MeteorNvim",
  },
  -- lightspeed.nvim
  -- {
  --   "ggandor/lightspeed.nvim",
  --   event = "VimEnter",
  -- },
}
