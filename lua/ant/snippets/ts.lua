require("luasnip.session.snippet_collection").clear_snippets("ts")

local ls = require("luasnip")

local s = ls.snippet
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("typescript", {
    s("/*", fmt("/*\n* {}\n*/", { i(1) })),
    s("/**", fmt("/**\n* {}\n*/", { i(1) })),
    s("for", fmt("for (let {}=0; {} < {}; {}++){{\n\t{}\n}}", { i(1), i(2), i(3), i(4), i(5) })),
    s("forr", fmt("for (const {} of {}){{\n\t{}\n}}", { i(1), i(2), i(3) })),
    s("await", fmt("await new Promise((res, rej) => setTimeout(res, {}));", { i(1) })),
    s("class", fmt("export class {} {{\n\tpublic constructor({}){{\n\t{}\n\t}}\n}}", { i(1), i(2), i(3) })),
    s("leet",
        fmt(
            "const assert = require('assert');\n\n/**\n* {}\n*/\nfunction {}({}) {{\n\n}}\n\n// --- Testing --- //\n\n{}",
            { i(1), i(2), i(3), i(4) }))
})
