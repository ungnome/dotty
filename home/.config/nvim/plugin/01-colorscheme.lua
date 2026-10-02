vim.pack.add({
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
})

require("catppuccin").setup({
    dim_inactive = {
        enabled = true,
        shade = "dark",
        percentage = 0.50,
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
