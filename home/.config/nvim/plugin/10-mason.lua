-- vim.pack.add({
--     { src = "https://github.com/neovim/nvim-lspconfig" },
--     { src = "https://github.com/mason-org/mason.nvim" },
--     { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
--     { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
-- })

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
    ensure_installed = {
        "bash-language-server",
        "emmet-language-server",
        "lua-language-server",
        "stylua",
        "marksman",
        "svelte-language-server",
        "tailwindcss-language-server",
        "terraform-ls",
        "typescript-language-server",
        "css-lsp",
        "html-lsp",
        "json-lsp",
        "yaml-language-server",
        "eslint_d",
        "prettierd",
        "gopls",
        "xmlformatter",
    },
})

-- config lsp servers
local util = require("lspconfig.util")

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {
                    "vim",
                    "require",
                },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
})

-- vim.lsp.config("pico8_ls", {
--     cmd = { "pico8-ls", "--stdio" },
--     filetypes = { "p8", "pico-8", "pico-8-lua" },
--     root_dir = function(bufnr, on_dir)
--         local fname = vim.api.nvim_buf_get_name(bufnr)
--         on_dir(util.root_pattern("*.p8")(fname))
--     end,
--
--     settings = {},
-- })
