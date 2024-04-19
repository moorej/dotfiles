return {
	"ThePrimeagen/harpoon",

	branch = "harpoon2",

	dependencies = {
		"neovim-lua/plenary.nvim",
	},

	config = function()
		local harpoon = require("harpoon")

		harpoon:setup()

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():append()
		end, { desc = "Append buffer to Harpoon list" })
		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Toggle Harpoon list" })

		vim.keymap.set("n", "<C-S-h>", function()
			harpoon:list():select(1)
		end, { desc = "Open Harpoon buffer 1" })
		vim.keymap.set("n", "<C-S-j>", function()
			harpoon:list():select(2)
		end, { desc = "Open Harpoon buffer 2" })
		vim.keymap.set("n", "<C-S-k>", function()
			harpoon:list():select(3)
		end, { desc = "Open Harpoon buffer 3" })
		vim.keymap.set("n", "<C-S-l>", function()
			harpoon:list():select(4)
		end, { desc = "Open Harpoon buffer 4" })

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<C-S-P>", function()
			harpoon:list():prev()
		end, { desc = "Switch to previous Harpoon buffer" })
		vim.keymap.set("n", "<C-S-N>", function()
			harpoon:list():next()
		end, { desc = "Switch to next Harpoon buffer" })
	end,
}
