-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "catppuccin",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}
M.mason.pkgs = {
  "lua-language-server",
  "javascript-language-server",
  "stylua",
  "html-lsp",
  "css-lsp",
  "prettier",
  "black",
  "debugpy",
  "mypy",
  "pyright",
}

return M
