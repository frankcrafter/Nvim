local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "single" })
		end,
	},
})

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	--- Base
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-tree/nvim-web-devicons")
	use("nvim-tree/nvim-tree.lua")

	--- Colorschemes
	use("ChristianChiarulli/onedark.nvim")

	--- Lualine
	use("nvim-lualine/lualine.nvim")

	--- Bufferline
	use("akinsho/bufferline.nvim")

	--- Treesitter
	use("nvim-treesitter/nvim-treesitter")

	--- LSP
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	--- LSP Kind
	use("onsails/lspkind.nvim")

	--- Formatter
	use("nvimtools/none-ls.nvim")
	use("stevearc/conform.nvim")
	-- Linter
	use("mfussenegger/nvim-lint")

	--- Completion
	use({
		"L3MON4D3/LuaSnip",
		tag = "v2.*",
		run = "make install_jsregexp",
	})
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")
	use("hrsh7th/cmp-cmdline")
	use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })

	--- AutoPairs
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	})
	--- AutoTag
	use({
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	})

	--- Indent Line
	use("lukas-reineke/indent-blankline.nvim")
	use("echasnovski/mini.indentscope")

	--- Colorizer
	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	})

	--- Jdtls
	use("mfussenegger/nvim-jdtls")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
