return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,

    config = function()
        require("tokyonight").setup({
            style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
            transparent = false, -- Enable this to disable setting the background color
            terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
            styles = {
                -- Style to be applied to different syntax groups
                -- Value is any valid attr-list value for `:help nvim_set_hl`
                sidebars = "dark", -- style for sidebars, see below
                floats = "dark", -- style for floating windows
            },
        })
        vim.cmd([[colorscheme tokyonight]])
    end,
}

