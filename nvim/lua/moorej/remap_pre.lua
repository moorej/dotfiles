vim.g.mapleader = " "

-- Open Project Explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open project explorer" })

-- Swap lines ala VSCode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- delete buffer without exiting
vim.keymap.set("n", "<leader>q", ":bp<cr> :bd #<cr>", { desc = "Close the current buffer, switch to previous buffer" })
