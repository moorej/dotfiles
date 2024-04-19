-- recommended mappings
-- resizing splits
-- these keymaps will also accept a range,
-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left, { desc = "Resize split left" })
vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down, { desc = "Resize split down" })
vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up, { desc = "Resize split up" })
vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right, { desc = "Resize split right" })
-- moving between splits
vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left, { desc = "Move corsor left" })
vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down, { desc = "Move corsor down" })
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up, { desc = "Move corsor up" })
vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right, { desc = "Move corsor right" })
vim.keymap.set("n", "<C-\\>", require("smart-splits").move_cursor_previous, { desc = "Move corsor previous buffer" })
-- swapping buffers between windows
vim.keymap.set("n", "<leader><leader>h", require("smart-splits").swap_buf_left, { desc = "Swap buffer left" })
vim.keymap.set("n", "<leader><leader>j", require("smart-splits").swap_buf_down, { desc = "Swap buffer down" })
vim.keymap.set("n", "<leader><leader>k", require("smart-splits").swap_buf_up, { desc = "Swap buffer up" })
vim.keymap.set("n", "<leader><leader>l", require("smart-splits").swap_buf_right, { desc = "Swap buffer right" })
