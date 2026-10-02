vim.pack.add({
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
})

require("catppuccin").setup({
    dim_inactive = {
        shade = "light",
        percentage = 0.25,
    },
    highlight_overrides = {
        mocha = function(mocha)
            return {
                Normal = { fg = mocha.text, bg = mocha.mantle },
                StatusLine = { fg = mocha.text, bg = mocha.mantle },
            }
        end,
    },
})

vim.cmd.colorscheme("catppuccin")
