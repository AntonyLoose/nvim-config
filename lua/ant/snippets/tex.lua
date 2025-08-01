require("luasnip.session.snippet_collection").clear_snippets("tex")

local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

ls.add_snippets("tex", {
    s("begin", fmt("\\begin{{{}}}\n\t\\item {} \n\\end{{{}}}", { i(1), i(2), rep(1) })),
    s("init", fmt([[
        %! TEX root = ./{}

        \documentclass[11pt]{{article}}

        % Font: Times New Roman
        \usepackage{{mathptmx}}

        % Line spacing
        \usepackage{{setspace}}
        \onehalfspacing

        % Page margins
        \usepackage[top=0.5in, left=1in, right=1in, bottom=1in]{{geometry}}

        % URLS
        \usepackage{{hyperref}}

        % Remove auto-indent
        \setlength{{\parindent}}{{0pt}}

        \begin{{document}}

        \title{{ {} }}
        \author{{Antony Smith Loose}}
        \date{{\today}}

        \maketitle

        {}

        \end{{document}}
    ]], { i(1), i(2), i(3) }))
})
