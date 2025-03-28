require("luasnip.session.snippet_collection").clear_snippets("cpp")

local ls = require("luasnip")

local s = ls.snippet
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("cpp", {
    s("main", fmt("int main(){{\n \t{} \n\treturn 1; \n}}", { i(1) })),
    s("for", fmt("for (int i=0; i < {}; i++){{\n\t{}\n}}", { i(1), i(2) }))
})
