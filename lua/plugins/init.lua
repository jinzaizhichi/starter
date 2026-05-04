return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

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
      require("nvim-treesitter").setup({
        ensure_installed = {
          "vim", "lua", "vimdoc", "luadoc", "printf",
          "html", "css", "python", "yaml", "bash",
        },
      })
    end,
  },

  { "christoomey/vim-tmux-navigator" },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {},
  },
  {
    "numToStr/Comment.nvim",
    keys = {
      { "<leader>/", mode = { "n", "v" }, desc = "toggle comment" },
    },
    config = function()
      require("Comment").setup()
    end,
  },
}
