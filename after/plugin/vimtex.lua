-- This allows clicking inside the PDF to jump to the LaTeX source in nvim
vim.g.vimtex_view_general_viewer = 'zathura'
vim.g.vimtex_view_general_options =
'--synctex-forward @line:@col:@tex --synctex-editor-command "nvim --server /tmp/nvim-server --remote-silent +@line @tex"'

vim.api.nvim_set_keymap('n', '<leader>lc', ':VimtexCompile<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>lv', ':VimtexView<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>lk', ':VimtexStop<CR>', { noremap = true })
