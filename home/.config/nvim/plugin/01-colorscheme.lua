vim.pack.add({
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
})

require("catppuccin").setup({
    highlight_overrides = {
        mocha = function(mocha)
            return {
                Normal = { fg = mocha.flamingo },
            }
        end,
    },
})

vim.cmd.colorscheme("catppuccin")
