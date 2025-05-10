--------------------------------------------------------------
--					 lua/core/keys.lua
--------------------------------------------------------------
-- keymap.set(mode, key sequence, command, options)
-- Keymap modes
-- 'n'			Normal mode
-- 'i'			Insert mode
-- 'v'			Visual mode
-- 'c'			Command mode
-- 't'			Term. mode
-- 'x'			Visual block mode


-- Setting custom mapleader (Custom keybindings)
vim.g.mapleader = ','
vim.g.localleader = '\\'

-- keymap.set(mode, key sequence, command, options)
local map = vim.api.nvim_set_keymap
local opts = { silent = true, noremap = true };

-- Execute custom key bindings after ";"
-- <leader>+key
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

-- Better window/tabs navigation (ctrl + key)
map("n", "<C-h>", "<C-w>h", opts)		-- Up
map("n", "<C-j", "<C-w>j", opts)		-- Down
map("n", "<C-h>", "<C-w>h", opts)		-- Left
map("n", "<C-l>", "<C-w>l", opts)		-- Right


-- Resize with arrows (ctrl + key)
map("n", "<C-Up>", ":resize -2<CR>", opts)				
map("n", "<C-Down>", ":resize +2<CR>", opts)			
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)		
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Go thru buffers (shift + key) 
map("n", "<S-l>", ":bnext <CR>", opts)
map("n", "<S-h>", ":bprevious <CR>", opts)

-- Move selection in visual mode (Alt + key)
map("v", "<A-j>", ":m .+1<CR>==", opts)
map("v", "<A-k>", ":m .-2<CR>==", opts)

-- Replace default paste behaviour
map("v", "p", '"_dP', opts)

-- code completion
local coc_opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}

-- use enter to select a snippet
map("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], coc_opts)

