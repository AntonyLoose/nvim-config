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
            "vague2k/vague.nvim",
        },
        {
            'everviolet/nvim',
            name = 'evergarden',
            priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
            opts = {
                theme = {
                    variant = 'fall', -- 'winter'|'fall'|'spring'|'summer'
                    accent = 'green',
                },
                editor = {
                    transparent_background = false,
                    sign = { color = 'none' },
                    float = {
                        color = 'mantle',
                        invert_border = false,
                    },
                    completion = {
                        color = 'surface0',
                    },
                },
            }
        },
        {
            'nvim-treesitter/nvim-treesitter',
            build = ":TSUpdate",
            opts = {
                highlight = { enable = true }
            }
        },
        {
            "neovim/nvim-lspconfig",
            config = function()
                local lsp = require("lspconfig")

                lsp.ts_ls.setup {}
                lsp.eslint.setup {}
                lsp.html.setup {}
                lsp.css_variables.setup {}
                lsp.bashls.setup {}
                lsp.texlab.setup {}
                lsp.lemminx.setup {}
                lsp.pyright.setup {}
                lsp.lua_ls.setup {
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                            },
                            workspace = {
                                checkThirdParty = false,
                                library = {
                                    vim.env.VIMRUNTIME,
                                },
                            },
                            hint = {
                                enable = true,
                            },
                            telemetry = { enable = false },
                        }
                    }
                }
            end
        },
        {
            "folke/neodev.nvim",
            config = true
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
