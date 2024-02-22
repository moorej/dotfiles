vim.g.mapleader = " "

-- Open Project Explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Swap lines ala VSCode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
