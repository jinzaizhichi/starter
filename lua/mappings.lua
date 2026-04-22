require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

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
end, { desc = "Open lazygit" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
