vim.pack.add({
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
})

require("catppuccin").setup({
    transparent_background = true,
    dim_inactive = {
        enabled = true, -- dims the background color of inactive window
        shade = "dark",
        percentage = 1.0, -- percentage of the shade to apply to the inactive window
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
