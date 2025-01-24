require("luasnip.session.snippet_collection").clear_snippets("c")

local ls = require("luasnip")

local s = ls.snippet
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("c", {
    s("main", fmt("int main(){{\n \t{} \n\treturn 1; \n}}", { i(1) }))
})
