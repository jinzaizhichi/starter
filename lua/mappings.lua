require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- map({ "n", "x" }, "mm", "<Cmd>Translate<CR>", { desc = " Translate" })
--     keys = {
--       -- 可以换成其他你想映射的键
--       { "mm", mode = { "n", "x" }, "<Cmd>Translate<CR>", desc = " Translate" },
--       { "mk", mode = { "n", "x" }, "<Cmd>TransPlay<CR>", desc = " Auto Play" },
--       -- 目前这个功能的视窗还没有做好，可以在配置里将view.i改成hover
--       { "mi", "<Cmd>TranslateInput<CR>", desc = " Translate From Input" },
--     },
