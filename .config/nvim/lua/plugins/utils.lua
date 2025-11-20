return {
	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		main = "nvim-treesitter.configs", -- Sets main module to use for opts
		opts = {
			ensure_installed = {},
			auto_install = true,
			highlight = {
				enable = true,
			},
		},
	},

	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},

	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				merge_duplicates = false,
				timeout = 2000,
				background_colour = "#000000",
				render = "wrapped-compact",
			})
			vim.notify = require("notify")
		end,
	},

	{ "wakatime/vim-wakatime", lazy = false, dependencies = { "nvim-lua/plenary.nvim" } },

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			local pairs = require("nvim-autopairs")

			pairs.setup({
				map_cr = true,
			})
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"nvim-tree/nvim-web-devicons",
		opts = {
			override_by_extension = {
				["rs"] = {
					icon = " ",
					color = "#f1502f",
					name = "Rs",
				},
			},
		},
	},
}
