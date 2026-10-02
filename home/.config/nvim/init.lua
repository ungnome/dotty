-------------------------------------------------------------------------------
-- local vars for use later on
-------------------------------------------------------------------------------
local opt = vim.opt
local map = vim.keymap.set
local lsp = vim.lsp

-------------------------------------------------------------------------------
-- options
-------------------------------------------------------------------------------
-- indentation
opt.autoindent = true
opt.smartindent = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.shiftround = true
opt.expandtab = true

-- cursor and position indicators
opt.cursorline = true
opt.colorcolumn = "80"
opt.mouse = "a"
opt.number = true
opt.relativenumber = true

-- context
opt.scrolloff = 10
opt.sidescrolloff = 10
opt.wrap = false
opt.signcolumn = "yes"
opt.listchars = "space:·,tab:> ,eol:$"

-- menu
opt.completeopt = "menu,menuone,preview,noinsert"
opt.wildmenu = true
opt.wildoptions = "pum"

-- confirm before closing buffer
opt.confirm = true

-- search and spelling
opt.ignorecase = true
opt.smartcase = true
opt.spelllang = "en"
opt.hlsearch = true
opt.incsearch = true

-- split behavior
opt.splitbelow = true
opt.splitright = true

-- colors
opt.termguicolors = true

-- only in 0.11+
nv = vim.version()
if nv.major >= 0 and nv.minor >= 11 then opt.winborder = "single" end

-------------------------------------------------------------------------------
-- install plugins
-------------------------------------------------------------------------------
-- only load plugins if running locally
if not vim.env.SSH_TTY then
    vim.pack.add({
        { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
        { src = "https://github.com/nvim-lua/plenary.nvim" },
        { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
        { src = "https://github.com/neovim/nvim-lspconfig" },
        { src = "https://github.com/mason-org/mason.nvim" },
        { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
        { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
        { src = "https://github.com/stevearc/conform.nvim" },
        { src = "https://github.com/nvim-mini/mini.nvim" },
        { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.x") },
    })
end

-------------------------------------------------------------------------------
-- keymaps
-------------------------------------------------------------------------------
-- move up/down by display lines, handles wrapped lines better
map("n", "j", "gj")
map("n", "k", "gk")

-- CTRL+[h|j|k|l] to switch windows in normal mode
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")

-- clear search highlights with ESC
map("n", "<ESC>", ":noh<CR><ESC>", { silent = true })

-- ALT+[h,j,k,l] to resize windows in normal mode
map("n", "<A-l>", "<C-w>>")
map("n", "<A-h>", "<C-w><")
map("n", "<A-k>", "<C-w>+")
map("n", "<A-j>", "<C-w>-")

-- files
map("n", "<leader>e", ":lua MiniFiles.open()<CR>", { desc = "File Explorer", silent = true })

-- code
map("n", "<F2>", function() lsp.buf.rename() end, { desc = "Rename Symbol", silent = true })
map("n", "<F3>", function() require("conform").format() end, { desc = "Format Buffer", silent = false })
-- map({ "n", "i", "s" }, "<C-s>", vim.lsp.buf.signature_help, { desc = "Show Signature help" })
map("n", "grd", ":lua vim.lsp.buf.definition()<CR>", { desc = "Goto Definition", silent = true })

-- find
map("n", "<leader>ff", ":Pick files<CR>", { desc = "Files (cwd)", silent = true })
map("n", "<leader>fg", ":Pick git_files<CR>", { desc = "Files (git)", silent = true })
map("n", "<leader>fb", ":Pick buffers<CR>", { desc = "Buffers", silent = true })

-- search
map("n", "<leader>sg", ":Pick grep_live<CR>", { desc = "Grep", silent = true })
map("n", "<leader>sh", ":Pick help<CR>", { desc = "Help", silent = true })
map("n", "<leader>sk", ":Pick keymaps<CR>", { desc = "Keybinds", silent = true })
map("n", "<leader>ss", ":Pick lsp scope='document_symbol'<CR>", { desc = "Buffer Symbols", silent = true })
map("n", "<leader>sS", ":Pick lsp scope='workspace_symbol'<CR>", { desc = "Workspace Symbols", silent = true })
map("n", "<leader>n", function() MiniNotify.show_history() end, { desc = "Notification", silent = true })

-- diagnostics
map("n", "<leader>x", vim.diagnostic.open_float, { desc = "Show Diagnostics" })

-------------------------------------------------------------------------------
-- filetypes
-------------------------------------------------------------------------------
vim.filetype.add({
    extension = {
        p8 = "pico-8",
        p8l = "pico-8-lua",
        sls = "saltstack",
        tf = "terraform",
    },
})

-------------------------------------------------------------------------------
-- autocmds
-------------------------------------------------------------------------------
-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight_yank", {}),
    desc = "Hightlight selection on yank",
    pattern = "*",
    callback = function() vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 }) end,
})

-- use tree-sitter highlighting rather than lsp
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        client.server_capabilities.semanticTokensProvider = nil
    end,
})

-- SaltStack
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.sls",
    command = "set ft=salt expandtab shiftwidth=2 tabstop=2",
})

-- Terraform
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.tf",
    command = "setlocal commentstring=#%s; | set ft=terraform",
})

-- Only show cursorline in active split
vim.api.nvim_create_autocmd("BufEnter", { pattern = "*", command = "set cursorline" })
vim.api.nvim_create_autocmd("BufLeave", { pattern = "*", command = "set nocursorline" })
