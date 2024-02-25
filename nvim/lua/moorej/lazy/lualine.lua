return {
	"nvim-lualine/lualine.nvim",

	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	lazy = false,

	config = function()
		local trim = function(from_start)
			return function(str, _)
				local max_len = vim.o.columns / 5
				local len = string.len(str)
				if len > max_len then
					if from_start then
						return "..." .. string.sub(str, (len - max_len) + 3)
					end
					return string.sub(str, 0, max_len - 3) .. "..."
				end
				return str
			end
		end
		require("lualine").setup({
			options = {
				theme = "tokyonight",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				always_divide_middle = true,
				globalstatus = true,
			},
			extensions = {
				"fugitive",
				"lazy",
				"quickfix",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "buffers" },
				lualine_c = {
					{
						"branch",
						fmt = trim(false),
					},
					{
						"diff",
						colored = true,
						diff_color = {
							added = "DiffAdd",
							modified = "DiffChange",
							removed = "DiffDelete",
						},
						symbols = {
							added = " ",
							removed = " ",
							modified = " ",
						},
					},
					{
						"filename",
						file_status = true,
						path = 1,
						fmt = trim(true),
					},
					{
						"%w",
						cond = function()
							return vim.wo.previewwindow
						end,
					},
					{
						"%r",
						cond = function()
							return vim.bo.readonly
						end,
					},
					{
						"%q",
						cond = function()
							return vim.bo.buftype == "quickfix"
						end,
					},
					{
						"searchcount",
					},
				},
				lualine_x = {
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						sections = { "error", "warn", "info" },
						symbols = {
							error = " ",
							warn = " ",
							info = " ",
						},
						update_in_insert = true,
						always_visible = true,
					},
				},
				lualine_y = {
					{
						"filetype",
					},
					{
						"encoding",
					},
					{
						"fileformat",
					},
				},
				lualine_z = {
					{
						"location",
					},
					{
						"progress",
					},
				},
			},
			inactive_sections = {
				lualine_c = { "%f %y %m" },
				lualine_x = {},
			},
		})
	end,
}
