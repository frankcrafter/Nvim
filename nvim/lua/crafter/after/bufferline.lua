local bufferline = require("bufferline")

bufferline.setup({
	options = {
		mode = "tabs",
		indicator = {
			icon = "▎", -- this should be omitted if indicator style is not 'icon'
			style = "icon",
		},
		offsets = { { filetype = "NvimTree", text = "", text_align = "center", padding = 1 } },
		colors_icons = true,
		show_buffer_icons = true,
		show_buffer_close_icons = false,
		show_close_icon = false,
		show_tab_indicators = false,
		separator_style = "thin",
		enforce_regular_tabs = false,
		always_show_bufferline = true,
	},
	highlights = {
		fill = {
			bg = "#282c34",
		},
	},
})
