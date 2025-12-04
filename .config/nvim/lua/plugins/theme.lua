return {

	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		-- Optional; default configuration will be used if setup isn't called.
		config = function()
			require("everforest").setup({
				transparent_background_level = 1,
			})
			-- vim.cmd([[colorscheme everforest]])
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
