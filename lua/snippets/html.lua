local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

return {
  -- HTML5 boilerplate
  s({ trig = "html5", dscr = "HTML5 boilerplate" }, t({
    "<!DOCTYPE html>",
    '<html lang="en">',
    "<head>",
    '  <meta charset="UTF-8">',
    '  <meta name="viewport" content="width=device-width, initial-scale=1.0">',
    "  <title>", "", "</title>",
    "</head>",
    "<body>",
    "  ", "",
    "</body>",
    "</html>",
  }), { i(1, "Title"), i(2) }),

  -- div
  s({ trig = "div", dscr = "div block" }, t({
    '<div class="', "", '">',
    "  ", "",
    "</div>",
  }), { i(1), i(2) }),

  -- script tag
  s({ trig = "script", dscr = "script tag" }, t('<script src="', "", '"></script>'), {
    i(1, "main.js"),
  }),

  -- link tag
  s({ trig = "linkcss", dscr = "CSS link tag" }, t(
    '<link rel="stylesheet" href="', "", '">'
  ), { i(1, "style.css") }),
}
