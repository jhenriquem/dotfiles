local icons = require("./configs/icons").icons

local config = {
	keymap = { preset = "default", ["<C-o>"] = { "select_and_accept" } },
	appearance = {
		nerd_font_variant = "mono",
		kind_icons = icons.ui.kind_icons_spaced,
	},

	cmdline = { enabled = true },
	completion = {
		documentation = {
			auto_show = true,
			window = {
				border = "rounded",
			},
		},

		menu = {
			scrollbar = false,
			draw = {
				treesitter = { "lsp" },
				align_to = "cursor",
				gap = 2,
				columns = {
					{ "kind_icon", gap = 1, "label" },
					{ "label_description" },
				},
			},
		},
	},
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
	fuzzy = { implementation = "prefer_rust_with_warning" },
}

return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets", "hrsh7th/nvim-cmp" },

	version = "1.*",

	opts = config,
	opts_extend = { "sources.default" },
}
