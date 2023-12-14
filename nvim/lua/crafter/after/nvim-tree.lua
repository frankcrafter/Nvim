require('nvim-tree').setup({
	hijack_cursor = true,
	diagnostics = {
		enable = true,
    show_on_dirs = true,
		icons = {
			info = " ",
			warning = " ",
			error = " ",
		},
	},
	filters = {
		dotfiles = false,
		custom = { ".git", ".DS_Store" },
		exclude = { ".gitignore", ".github" },
	},
	renderer = {
    root_folder_label = ":~:s?$?",
    indent_width = 3,
    indent_markers = {
      enable = true,
      inline_arrows = true,
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            bottom = "─",
            none = " ",
          },
    },
		icons = {
			git_placement = "before",
			padding = "  ",
      show = {
        folder_arrow = false,
      },
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_closed = "",
					arrow_open = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "",
					staged = "",
					unmerged = "",
					renamed = "➜",
					untracked = "",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
	view = {
		width = 32,
	},
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
})

vim.keymap.set('n', '<C-n>', ':NvimTreeFindFileToggle<CR>')
