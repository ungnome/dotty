vim.pack.add({
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
})

require("catppuccin").setup({
    highlight_overrides = {
        mocha = function(mocha)
            return {
                Normal = { fg = mocha.text, bg = mocha.mantle },
                StatusLine = { fg = mocha.text, bg = mocha.surface0 }

            }
        end,
    },
})

vim.cmd.colorscheme("catppuccin")
