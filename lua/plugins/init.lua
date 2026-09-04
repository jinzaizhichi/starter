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

  -- treesitter：复用 NvChad 内置机制（branch=main、event、build=:TSUpdate|TSInstallAll、
  -- 高亮 autocmd 均由 NvChad 提供），这里只补充要预装的 parser。
  -- 之前的自定义 spec 用 config+setup 覆盖了 NvChad，导致 parser 从不安装、高亮失效。
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
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
        "go",
        "gomod",
      })
      return opts
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

  -- tmux 无缝导航：NvChad 默认 lazy=true，无触发条件则永不加载、映射失效，
  -- 故用 keys 声明按键触发（懒加载 + 注册 <C-hjkl>）
  {
    "christoomey/vim-tmux-navigator",
    keys = {
      { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "窗口/tmux 左移" },
      { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "窗口/tmux 下移" },
      { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "窗口/tmux 上移" },
      { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "窗口/tmux 右移" },
    },
  },

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
    -- build = "cd app && yarn install",
    -- config = function()
    --   vim.g.mkdp_filetypes = { "markdown" }
    -- end,
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    init = function()
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
