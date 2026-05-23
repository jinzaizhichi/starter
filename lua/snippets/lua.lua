local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

return {
  -- lazy.nvim plugin spec
  s(
    { trig = "lazyplug", dscr = "lazy.nvim plugin spec" },
    t({
      "{",
      '  "', "", '",',
      '  event = "', "", '",',
      '  opts = {},',
      "},",
    }),
    { i(1, "author/repo"), i(2, "VeryLazy") }
  ),

  -- keymap
  s(
    { trig = "vmap", dscr = "vim.keymap.set" },
    t({ 'vim.keymap.set("', "", '", "', "", '", function()', "  ", "", "end, { desc = ", '"', "", '" })' }),
    { i(1, "n"), i(2, "<leader>"), i(3, ""), i(4, "description") }
  ),

  -- augroup + autocmd
  s(
    { trig = "aug", dscr = "augroup + autocmd" },
    t({
      'local group = vim.api.nvim_create_augroup("', "", '", { clear = true })',
      'vim.api.nvim_create_autocmd("', "", '", {',
      "  group = group,",
      '  pattern = "', "", '",',
      "  callback = function()",
      "    ", "",
      "  end,",
      "})",
    }),
    { i(1, "MyGroup"), i(2, "BufWritePre"), i(3, "*"), i(4) }
  ),

  -- config module template
  s(
    { trig = "cfg", dscr = "config module return {}" },
    t({ "local M = {}", "", "function M.setup()", "  ", "", "end", "", "return M" }),
    { i(1) }
  ),

  -- pcall wrapper
  s({ trig = "pcall", dscr = "pcall with error handling" }, t({
    "local ok, err = pcall(function()",
    "  ", "",
    "end)",
    'if not ok then vim.notify(err, vim.log.levels.ERROR) end',
  }), { i(1) }),

  -- module require
  s({ trig = "rq", dscr = "local x = require('x')" }, t("local ", "", " = require('", "", "')"), {
    i(1), i(2),
  }),
}
