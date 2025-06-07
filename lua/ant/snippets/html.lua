--Enable (broadcasting) snippet capability for completion
--[[
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.config('html', {
  capabilities = capabilities,
})
--]]

local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

snippets = { }

ls.add_snippets("html", snippets)
