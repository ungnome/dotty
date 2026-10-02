vim.pack.add({
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
})

require("catppuccin").setup({
    color_overrides = {
        mocha = function(mocha)
            return {
                base = mocha.mantle,
            }
        end,
    },
})

vim.cmd.colorscheme("catppuccin")
