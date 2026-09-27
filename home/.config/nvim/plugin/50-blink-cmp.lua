-- vim.pack.add({
--     { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.x") },
-- })

require("blink.cmp").setup({
    keymap = { preset = "default" },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    sources = { default = { "lsp", "path", "snippets", "buffer" } },
    signature = { enabled = true },
})
