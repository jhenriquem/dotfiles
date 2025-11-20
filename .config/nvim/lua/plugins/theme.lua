return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
		},
	},
	{
		"H4ckint0sh/nord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nord").setup({
				transparent = true,
				borders = true,

				on_highlights = function(highlights, colors)
					highlights.FzfLuaBorder = { bg = colors.none }
					highlights.Pmenu = { bg = colors.none }
					highlights.NormalFloat = { bg = colors.none }
				end,
			})
			-- vim.cmd("colorscheme nord")
		end,
	},

	{
		"vague2k/vague.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other plugins
		config = function()
			-- NOTE: you do not need to call setup if you don't want to.
			require("vague").setup({
				transparent = true,
			})

			-- vim.cmd("colorscheme tokyonight-night")
			vim.cmd("colorscheme vague")
		end,
	},
}
