vim.pack.add({
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
})

require("catppuccin").setup({
    color_overrides = {
        mocha = {
            Normal = {
                bg = "mantle",
            },
        },
    },
})

vim.cmd.colorscheme("catppuccin")
