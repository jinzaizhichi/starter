local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local d = ls.dynamic_node
local f = ls.function_node

local function date()
  return { t(os.date("%Y-%m-%d")) }
end

return {
  -- 日期
  s("date", t(os.date("%Y-%m-%d"))),
  s("time", t(os.date("%H:%M:%S"))),
  s("datetime", t(os.date("%Y-%m-%d %H:%M:%S"))),

  -- TODO
  s("todo", t("# TODO(jinzaizhichi): ")),

  -- shebang
  s({ trig = "shb", dscr = "#!/usr/bin/env" }, t("#!/usr/bin/env "), i(1)),
}
