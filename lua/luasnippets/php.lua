require("luasnip.session.snippet_collection").clear_snippets("r")

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("php", {

  -- Function 定義
  s(
    "aj",
    fmt(
      [[
    return $this->ajaxJson({},{});
]],
      {
        i(1, "bool"),
        i(2, "$param"),
      }
    )
  ),

  -- Function note
  --
  s(
    { trig = "fnn", name = "public function" },
    fmt(
      [[
  
    /**
    *
    * {}
    *
    * @header Content-Type application/json
    *
    * @response {{
    *     "code": 200,
    *     "data": [],
    *     "msg": ""
    * }}
    *
    */
]],
      {
        i(1, "description"),
      }
    )
  ),
})
