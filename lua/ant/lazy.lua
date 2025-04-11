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
            "rose-pine/nvim",
            config = function()
                vim.cmd('colorscheme rose-pine')
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
            servers = {
                tsserver = false,         -- Disable deprecated default
                tsserver_custom = {},     -- Let LazyVim know this exists
                eslint = {},
                cssmodules_ls = {},
                html = {},
                clangd = {},
            },
            setup = {
                -- This is to get rid of the "tsserver is deprecated, use ts_ls instead", ts_ls does not exist on my MacOS for some unknown reason
                tsserver_custom = function(_, opts)
                    local lspconfig = require("lspconfig")

                    if not lspconfig.configs.tsserver_custom then
                        lspconfig.configs.tsserver_custom = {
                            default_config = {
                                name = "tsserver_custom",
                                cmd = { "typescript-language-server", "--stdio" },
                                filetypes = {
                                    "javascript", "javascriptreact", "javascript.jsx",
                                    "typescript", "typescriptreact", "typescript.tsx",
                                },
                                root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
                                single_file_support = true,
                            },
                        }
                    end

                    lspconfig.tsserver_custom.setup(opts)
                    return true
                end,
            },
        },
        {
            "hrsh7th/nvim-cmp",
            lazy = false,
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
