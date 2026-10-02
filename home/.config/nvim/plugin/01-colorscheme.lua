vim.pack.add({
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
})

require("catppuccin").setup({
    color_overrides = {
        mocha = {
            background = "#181825",
        },
    },
})

vim.cmd.colorscheme("catppuccin")
