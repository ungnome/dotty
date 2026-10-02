vim.pack.add({
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
})

require("catppuccin").setup({
    color_overrides = {
        mocha = {
            Normal = {
                bg = "#181825",
            },
        },
    },
})

vim.cmd.colorscheme("catppuccin")
