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

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },

  { "christoomey/vim-tmux-navigator" },
  {
    "greggh/claude-code.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("claude-code").setup({
        -- 终端窗口设置
        window = {
          position = "vertical", -- 竖向分屏，也可以改成 "horizontal" 或 "float"
          split_ratio = 0.4,     -- 占屏幕宽度的 40%
        },
        -- 按键映射
        keymaps = {
          toggle = {
            normal = "<leader>cc",  -- 普通模式切换
            terminal = "<leader>cc", -- 终端模式切换
          },
          window_navigation = true,
          scrolling = true,
        },
      })
    end,
  },
}
