vim.pack.add({
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
})

require("catppuccin").setup({
    highlights_overrides = {
        mocha = function(colors)
            return {
                Normal = { bg = colors.mantle}
            }
        end
    }
})

vim.cmd.colorscheme("catppuccin")
