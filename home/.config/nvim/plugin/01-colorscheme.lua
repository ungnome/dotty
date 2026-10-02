vim.pack.add({
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
})

-- require("catppuccin").setup({
--     -- color_overrides = {
--     --     mocha = {
--     --         base = "#000000"
--     --     }
--     -- }
--     -- highlight_overrides = {
--     --     latte = function(latte)
--     --         return {
--     --             StatusLine = { fg = latte.text, bg = latte.base },
--     --         }
--     --     end,
--     --     mocha = function(mocha)
--     --         return {
--     --             Normal = { fg = mocha.text, bg = "#000000" },
--     --             StatusLine = { fg = mocha.text, bg = mocha.base },
--     --         }
--     --     end,
--     -- },
-- })

vim.cmd.colorscheme("catppuccin")
