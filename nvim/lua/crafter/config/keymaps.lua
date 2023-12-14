local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "x", '"_x')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- New tab
keymap.set("n", "te", ":tabedit<CR>")

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Better escape using jk in insert and terminal mode
keymap.set("i", "jk", "<ESC>")

-- Switch buffer
keymap.set("n", "<Tab>", "<Cmd>:BufferLineCycleNext<CR>")
keymap.set("n", "<S-Tab>", "<Cmd>:BufferLineCyclePrev<CR>")
keymap.set("n", "<S-c>", "<Cmd>:bdelete!<CR>")

-- Diagnostics
keymap.set("n", "<C-j>", function()
	vim.diagnostic.goto_next()
end, opts)

-- Code Action
keymap.set("n", "<Space>ca", ":lua vim.lsp.buf.code_action()<CR>")
-- Update Config
keymap.set("n", "<Space>ju", ":JdtUpdateConfig<CR>")

-- Compile Project
keymap.set("n", "<F5>", function()
	vim.cmd("bot 15 new | term " .. "./mvnw clean compile")
end, opts)

-- Run Project
keymap.set("n", "<F10>", function()
	vim.cmd("bot 15 new | term " .. "./mvnw spring-boot:run")
end, opts)
