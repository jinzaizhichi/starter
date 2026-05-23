local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

return {
  -- flex center
  s({ trig = "flex", dscr = "flexbox center" }, t({
    "display: flex;",
    "justify-content: center;",
    "align-items: center;",
  })),

  -- media query
  s({ trig = "media", dscr = "media query" }, t({
    "@media (max-width: ", "", "px) {",
    "  ", "",
    "}",
  }), { i(1, "768"), i(2) }),
}
