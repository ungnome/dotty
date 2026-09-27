-- run :TSUpdate when nvim-treesitter plugin is updated
vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == "nvim-treesitter" and kind == "update" then
            if not ev.data.active then vim.cmd.packadd("nvim-treesitter") end
            vim.cmd("TSUpdate")
        end
    end,
})

-- vim.pack.add({
--     { src = "https://github.com/nvim-lua/plenary.nvim" },
--     { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
-- })

local ts_filetypes = {
    "bash",
    "css",
    "go",
    "hcl",
    "html",
    "javascript",
    "json",
    "python",
    "regex",
    "svelte",
    "toml",
    "tsx",
    "terraform",
    "typescript",
    "vue",
    "yaml",
}

-- install parsers
require("nvim-treesitter").install(ts_filetypes)

-- PICO-8
table.insert(ts_filetypes, "pico-8")
table.insert(ts_filetypes, "pico-8-lua")
vim.treesitter.language.register("lua", "pico-8")
vim.treesitter.language.register("lua", "pico-8-lua")

vim.api.nvim_create_autocmd("FileType", {
    pattern = ts_filetypes,
    callback = function() vim.treesitter.start() end,
})
