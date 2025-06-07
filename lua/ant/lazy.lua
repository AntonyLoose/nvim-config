local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        {
            "nvim-telescope/telescope.nvim",
            branch = "0.1.x",
            opts = {},
            dependencies = { "nvim-lua/plenary.nvim" }
        },
        {
            "folke/tokyonight.nvim",
            lazy = false,
            priority = 1000,
            config = function()
                vim.cmd('colorscheme tokyonight-night')
            end
        },
        {
            'nvim-treesitter/nvim-treesitter',
            opts = {
                highlight = { enable = true }
            }
        },
        {
            "neovim/nvim-lspconfig",
            config = function()
                require("lspconfig").lua_ls.setup {}
                require("lspconfig").tsserver.setup {}
                require("lspconfig").eslint.setup {}
                require("lspconfig").html.setup {}
                require("lspconfig").css_variables.setup {}
                require("lspconfig").bashls.setup {}
            end
        },
        {
            "hrsh7th/nvim-cmp",
            dependencies = {
                "onsails/lspkind.nvim",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-buffer",
                { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
                "saadparwaiz1/cmp_luasnip"
            }
        },
        {
            "lervag/vimtex",
            version = "v2.15",
            config = function()
                vim.g.vimtex_view_method = "zathura"
                vim.g.vimtex_compiler_method = "latexmk"
            end
        }
    },
    -- automatically check for plugin updates
    checker = {
        enabled = true,
        notify = false
    },
})
