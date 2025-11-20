return {
	{ "williamboman/mason.nvim", opts = {} },
	{
		"williamboman/mason-lspconfig.nvim",
		event = "BufReadPre",
		opts = {
			ensure_installed = require("../utils/servers").servers,
			automatic_installation = true,
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"stylua",
				"goimports",
				"gofumpt",
			},
			automatic_installation = true,
		},
	},
}
