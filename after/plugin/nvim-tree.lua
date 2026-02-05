local api = require("nvim-tree.api")

require("nvim-tree").setup({
    sync_root_with_cwd = true,
    update_focused_file = {
        enable = true,
    },
    actions = {
        open_file = {
            quit_on_open = true, 
        },
    },
    view = {
        float = {
            enable = true, 
            open_win_config = {
                relative = "editor",
                width = 100,
                height = 50,
                row = 5,
                col = 30,
            },
        },
    },
})

vim.keymap.set("n", "<leader>rf", function() api.tree.open({ find_file = true })
end, { desc = "Rename file (opens tree, press r)" })

-- Auto-close nvim-tree when leaving its buffer
vim.api.nvim_create_autocmd("BufLeave", {
    pattern = "NvimTree_*",
    callback = function()
        vim.schedule(function()
            api.tree.close()
        end)
    end,
})
