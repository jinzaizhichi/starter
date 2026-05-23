local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

return {
  -- shebang + encoding
  s(
    { trig = "pyhead", dscr = "Python file header" },
    t({
      "#!/usr/bin/env python3",
      "# -*- coding: utf-8 -*-",
      "",
    })
  ),

  -- if __name__ == "__main__"
  s({ trig = "main", dscr = "if __name__ == '__main__'" }, t({
    'if __name__ == "__main__":',
    "    ", "",
  }), { i(1) }),

  -- function with docstring
  s(
    { trig = "def", dscr = "function with docstring" },
    t({
      "def ", "", "(", "", "):",
      '    """', "", '"""',
      "    ", "",
    }),
    { i(1, "func_name"), i(2, "args"), i(3, "docstring"), i(4) }
  ),

  -- try/except
  s({ trig = "try", dscr = "try/except block" }, t({
    "try:",
    "    ", "",
    "except Exception as e:",
    '    print(f"Error: {e}")',
  }), { i(1) }),

  -- class
  s(
    { trig = "cls", dscr = "class definition" },
    t({
      "class ", "", "(", "", "):",
      '    """', "", '"""',
      "",
      "    def __init__(self):",
      "        ", "",
    }),
    { i(1, "ClassName"), i(2, "object"), i(3, "docstring"), i(4) }
  ),

  -- ipdb breakpoint
  s({ trig = "ipdb", dscr = "ipdb breakpoint" }, t("__import__('ipdb').set_trace()  # BREAKPOINT")),

  -- list comprehension
  s({ trig = "lc", dscr = "list comprehension" }, t("[", "", " for ", "", " in ", "", "]"), {
    i(1, "x"), i(2, "x"), i(3, "items"),
  }),

  -- dict comprehension
  s({ trig = "dc", dscr = "dict comprehension" }, t("{", "", ": ", "", " for ", "", " in ", "", "}"), {
    i(1, "k"), i(2, "v"), i(3, "k"), i(4, "items"),
  }),

  -- with open
  s({ trig = "wf", dscr = "with open() as f" }, t({
    'with open("', "", '", "', "", '") as f:',
    "    ", "",
  }), { i(1, "file.txt"), i(2, "r"), i(3) }),
}
