local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

return {
  -- safe bash header
  s({ trig = "bashhead", dscr = "Safe bash script header" }, t({
    "#!/usr/bin/env bash",
    "",
    "set -euo pipefail",
    "IFS=$'\\n\\t'",
    "",
  })),

  -- if statement
  s({ trig = "if", dscr = "if statement" }, t({
    "if [[ ", "", " ]]; then",
    "  ", "",
    "fi",
  }), { i(1, "condition"), i(2) }),

  -- if/else
  s({ trig = "ife", dscr = "if/else statement" }, t({
    "if [[ ", "", " ]]; then",
    "  ", "",
    "else",
    "  ", "",
    "fi",
  }), { i(1, "condition"), i(2), i(3) }),

  -- for loop
  s({ trig = "for", dscr = "for loop" }, t({
    "for ", "", " in ", "", "; do",
    "  ", "",
    "done",
  }), { i(1, "item"), i(2, '"${items[@]}"'), i(3) }),

  -- while read
  s({ trig = "whileread", dscr = "while read loop" }, t({
    "while IFS= read -r ", "", "; do",
    "  ", "",
    "done", ' < "', "", '"',
  }), { i(1, "line"), i(2), i(3, "input.txt") }),

  -- function
  s(
    { trig = "func", dscr = "bash function" },
    t({
      "function ", "", "() {",
      "  local ", "", "",
      "",
      "  ", "",
      "}",
    }),
    { i(1, "name"), i(2), i(3) }
  ),

  -- echo with variable
  s({ trig = "echov", dscr = "echo variable" }, t('echo "', "", '=$', "", '"'), {
    i(1, "label"), i(2, "VAR"),
  }),
}
