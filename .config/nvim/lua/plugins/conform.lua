return {
	{ -- Autoformat
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		config = function()
			local conform = require("conform")
			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					markdown = { "prettier" },
					json = { "prettier" },
					go = { "gofumpt", "goimports" },
				},
				format_on_save = {
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				},
			})
			vim.keymap.set("n", "<space>c", function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end, {
				desc = "[F]ormat buffer",
			})
		end,
	},
}
