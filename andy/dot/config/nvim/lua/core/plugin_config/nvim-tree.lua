vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()

-- Open nvim-tree by 'n' in command mode
vim.keymap.set('n', 'n', [[:NvimTreeToggle]], {})
