require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"cssls",
		"html",
		"jdtls",
		"lua_ls",
		"tailwindcss",
		"tsserver",
	},
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").lua_ls.setup({
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
			completion = {
				callSnippet = "Replace",
			},
		},
	},
})

require("lspconfig").tsserver.setup({
	capabilities = capabilities,
})

require("lspconfig").cssls.setup({
	capabilities = capabilities,
})

require("lspconfig").tailwindcss.setup({
	capabilities = capabilities,
})

require("lspconfig").html.setup({
	capabilities = capabilities,
})

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = "󰃤", Warn = "󰃤", Hint = "󰃤", Info = "󰃤" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
	underline = true,
	update_in_insert = false,
	virtual_text = {
		spacing = 4,
		source = "if_many",
		prefix = "●",
	},
})
