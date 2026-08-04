return {
  -- 禁用 NvChad 内置 nvim-cmp，改用 blink.cmp
  { "hrsh7th/nvim-cmp", enabled = false },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    event = "VeryLazy",
    build = ":TSUpdate",
    config = function()
      pcall(function()
        dofile(vim.g.base46_cache .. "syntax")
        dofile(vim.g.base46_cache .. "treesitter")
      end)
      require("nvim-treesitter").setup {
        ensure_installed = {
          "vim",
          "lua",
          "vimdoc",
          "luadoc",
          "printf",
          "html",
          "css",
          "python",
          "yaml",
          "bash",
          "typescript",
          "javascript",
          "tsx",
          "json",
          "markdown",
          "markdown_inline",
        },
      }
    end,
  },

  -- blink.cmp 替代 nvim-cmp（Rust 原生，更快）
  {
    "saghen/blink.cmp",
    version = "*",
    event = "InsertEnter",
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        init = function()
          vim.g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/snippets/"
        end,
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
          require("luasnip").config.set_config(opts)
          require "nvchad.configs.luasnip"
        end,
      },
    },
    opts = require "configs.blink",
  },

  -- nvim-autopairs（原为 nvim-cmp 依赖，需单独声明）
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      fast_wrap = {},
      disable_filetype = { "TelescopePrompt", "vim" },
    },
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)
      pcall(function()
        require("nvim-autopairs.completion.blink").setup()
      end)
    end,
  },

  { "christoomey/vim-tmux-navigator" },

  -- Markdown 内部渲染
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    opts = {},
  },

  -- Markdown 浏览器预览
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
    build = "cd app && yarn install",
    config = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {},
  },
  {
    "numToStr/Comment.nvim",
    lazy = true,
    config = function()
      require("Comment").setup()
    end,
  },
}
