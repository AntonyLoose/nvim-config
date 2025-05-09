require("luasnip.session.snippet_collection").clear_snippets("js")
require("luasnip.session.snippet_collection").clear_snippets("ts")

local ls = require("luasnip")

local s = ls.snippet
local i = ls.insert_node
local rep = require("luasnip.extras").rep

local fmt = require("luasnip.extras.fmt").fmt

snippets = {
    s("/*", fmt("/*\n * {}\n */", { i(1) })),
    s("/**", fmt("/**\n * {}\n */", { i(1) })),
    s("//-", fmt("// ---- {} ---- //", { i(1) })),
    s("log", fmt('console.log("----- {} -----");', { i(1) })),
    s("?", fmt("{} ? {} : {}", { i(1), i(2), i(3) })),
    s("if", fmt("if ({}) {{\n\t{}\n}}", { i(1), i(2) })),
    s("for", fmt("for (let {}=0; {} < {}; {}++){{\n\t{}\n}}", { i(1), rep(1), i(2), rep(1), i(3) })),
    s("forr", fmt("for (const {} of {}){{\n\t{}\n}}", { i(1), i(2), i(3) })),
    s("fun", fmt("function {}({}){{\n\t{}\n}}", { i(1), i(2), i(3) })),
    s("await", fmt("await new Promise((res, rej) => setTimeout(res, {}));", { i(1) })),
    s("class", fmt("export class {} {{\n\tpublic constructor({}){{\n\t{}\n\t}}\n}}", { i(1), i(2), i(3) })),
    s("pub", fmt("public {}({}){{\n\t{}\n}}", { i(1), i(2), i(3) })),
    s("priv", fmt("private _{}({}){{\n\t{}\n}}", { i(1), i(2), i(3) })),
    s("this", fmt("this.{} = {}", { i(1), rep(1) })),
    s("this_", fmt("this._{} = {}", { i(1), rep(1) })),
    s("err", fmt("throw new Error(`{}`);", { i(1) })),
    s("errm", fmt('throw new Error("Method not implemented yet.");', {})),
    s("leet",
        fmt(
            "const assert = require('assert');\n\n/**\n* {}\n*/\nfunction {}({}) {{\n\n}}\n\n// --- Testing --- //\n\n{}",
            { i(1), i(2), i(3), i(4) }))
}

ls.add_snippets("javascript", snippets)
ls.add_snippets("typescript", snippets)
