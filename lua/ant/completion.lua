vim.opt.completeopt = { "menu", "menuone", "noselect" }

local lspkind = require("lspkind")
lspkind.init({})

local cmp = require("cmp")

cmp.setup({
    sources = {
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "buffer" }
    },
    mapping = {
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-y>"] = cmp.mapping(
            cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true
                },
                { "i", "c" }
            )
        )
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end
    }
})

local ls = require("luasnip")
ls.config.set_config({
    history = false,
    updateevents = "TextChanged,TextChangedI"
})

for _, file_path in ipairs(vim.api.nvim_get_runtime_file("lua/ant/snippets/*.lua", true)) do
    loadfile(file_path)()
end

vim.keymap.set({ "i", "s" }, "<c-k>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true })
