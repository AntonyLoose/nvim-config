require("luasnip.session.snippet_collection").clear_snippets("js")

local ls = require("luasnip")

local s = ls.snippet
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("javascript", {
    s("for", fmt("for (let {}=0; {} < {}; {}++){{\n\t{}\n}}", { i(1), i(2), i(3), i(4) })),
    s("await", fmt("await new Promise((res, rej) => setTimeout(res, {}));", { i(1) })),
    s("leet",
        fmt(
            "const assert = require('assert');\n\nfunction {}({}) {{\n\n}}\n\n// --- Testing --- //\n\n{}",
            { i(1), i(2), i(3) }))
})
