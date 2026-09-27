-- vim.pack.add({
--     { src = "https://github.com/stevearc/conform.nvim" },
-- })

require("conform").setup({
    formatters_by_ft = {
        bash = { lsp_format = "prefer" },
        sh = { lsp_format = "prefer" },
        go = { lsp_format = "prefer" },
        lua = { "stylua" },
        markdown = { "prettierd", "prettier", stop_after_first = true },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        yaml = { "prettierd", "prettier", stop_after_first = true },
        html = { "prettierd", "prettier", stop_after_first = true },
        css = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettierd", "prettier", stop_after_first = true },
        jsonc = { "prettierd", "prettier", stop_after_first = true },
        svelte = { "prettierd", "prettier", stop_after_first = true },
        terraform = { lsp_format = "prefer" },
        python = { "ruff_format" },
        xml = { "xmlformatter" },
        ["pico-8-lua"] = { "stylua" },
    },
})
