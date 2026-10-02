vim.pack.add({
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
})

-- require("catppuccin").setup({
--     color_overrides = {
--         mocha = {
--             base = "#181825", -- set base to mantle
--         },
--     },
-- })

vim.cmd.colorscheme("catppuccin")
