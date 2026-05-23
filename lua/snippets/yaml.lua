local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

return {
  -- YAML document start
  s({ trig = "yaml", dscr = "YAML document start" }, t({
    "---",
    "",
    "...",
  }), { i(1) }),
}
