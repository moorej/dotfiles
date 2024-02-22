return {
    'akinsho/bufferline.nvim',

    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },

    config = function() 
        vim.opt.termguicolors = true
        bufferline = require('bufferline')
        bufferline.setup {
            options = {
                style_preset = bufferline.style_preset.minimal,
            },
        }
    end,
}
