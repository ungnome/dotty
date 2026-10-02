vim.pack.add({
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
})

require("catppuccin").setup({
    dim_inactive = {
        enabled = true, -- dims the background color of inactive window
        shade = "light",
        percentage = 0.25, -- percentage of the shade to apply to the inactive window
    },
    highlight_overrides = {
        mocha = function(mocha)
            return {
                Normal = { fg = mocha.text, bg = mocha.mantle },
                StatusLine = { fg = mocha.base, bg = mocha.lavender },
            }
        end,
    },
})

vim.cmd.colorscheme("catppuccin")
