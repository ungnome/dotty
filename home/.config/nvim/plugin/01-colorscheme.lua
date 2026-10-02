vim.pack.add({
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
})

require("catppuccin").setup({
    dim_inactive = {
        enabled = true, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.25, -- percentage of the shade to apply to the inactive window
    },
    highlight_overrides = {
        latte = function(latte)
            return {
                StatusLine = { fg = latte.text, bg = latte.base },
            }
        end,
        mocha = function(mocha)
            return {
                Normal = { fg = mocha.text, bg = mocha.mantle },
                StatusLine = { fg = mocha.text, bg = mocha.mantle },
            }
        end,
    },
})

vim.cmd.colorscheme("catppuccin")
