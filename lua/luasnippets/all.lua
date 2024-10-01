require("luasnip.session.snippet_collection").clear_snippets("r")

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("all", {
  s("hi", {
    t("hello, world"),
  }),
})
