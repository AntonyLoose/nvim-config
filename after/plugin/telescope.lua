local ts = require('telescope')
ts.setup({
    defaults = {
        file_ignore_patterns = { "node_modules" }
    }
})

local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = 'Telescope diagnostics' })
vim.keymap.set('n', '<leader>pg', builtin.git_files, { desc = 'Telescope git files' })
