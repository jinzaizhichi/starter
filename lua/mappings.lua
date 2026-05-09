require "nvchad.mappings"

local map = vim.keymap.set

-- ============================================================
-- 通用
-- ============================================================
map("n", ";", ":", { desc = "进入命令行模式" })
map("i", "jk", "<ESC>", { desc = "退出插入模式" })

-- ============================================================
-- 窗口 / 标签
-- ============================================================

-- lazygit 浮动终端
map("n", "<leader>gg", function()
  local Terminal = require("toggleterm.terminal").Terminal
  local lazygit = Terminal:new({
    cmd = "lazygit",
    direction = "float",
    float_opts = { border = "curved" },
    on_close = function()
      vim.cmd("checktime")
    end,
  })
  lazygit:toggle()
end, { desc = "打开 lazygit" })

-- ============================================================
-- Markdown
-- ============================================================
map("n", "<leader>mp", "<cmd>MarkdownPreview<CR>", { desc = "Markdown 浏览器预览" })
map("n", "<leader>ms", "<cmd>MarkdownPreviewStop<CR>", { desc = "停止 Markdown 预览" })
map("n", "<leader>mt", "<cmd>MarkdownPreviewToggle<CR>", { desc = "切换 Markdown 预览" })
