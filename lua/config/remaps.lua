------------------------------
-- Config: remapping
------------------------------

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<s-l>", ":bnext<cr>", opts) -- Next Tab 
keymap("n", "<s-h>", ":bprevious<cr>", opts) -- Previous tab

keymap("n", "<s-Left>", "<C-w>h", opts)
keymap("n", "<s-Down>", "<C-w>j", opts)
keymap("n", "<s-Up>", "<C-w>k", opts)
keymap("n", "<s-Right>", "<C-w>l", opts)
