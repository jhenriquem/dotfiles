local render = function(props)
	local devicons = require("nvim-web-devicons")
	local config_icons = require("./configs/icons").icons

	local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
	if filename == "" then
		filename = ""
	end
	local ft_icon, ft_color = devicons.get_icon_color(filename)

	local function get_git_diff()
		local icons = { removed = "-", changed = "~", added = "+" }
		local signs = vim.b[props.buf].gitsigns_status_dict
		local labels = {}
		if signs == nil then
			return labels
		end
		for name, icon in pairs(icons) do
			if tonumber(signs[name]) and signs[name] > 0 then
				table.insert(labels, { icon .. signs[name] .. " ", group = "Diff" .. name })
			end
		end
		if #labels > 0 then
			table.insert(labels, { " " })
		end
		return labels
	end

	local function get_diagnostic_label()
		local icons = {
			error = config_icons.ui.icons.error,
			warn = config_icons.ui.icons.warning,
			hint = config_icons.ui.icons.info,
		}
		local label = {}

		for severity, icon in pairs(icons) do
			local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
			if n > 0 then
				table.insert(label, { icon .. n .. " ", group = "DiagnosticSign" .. severity })
			end
		end
		return label
	end

	local wakatime = require("../utils/wakatime")
	return {
		{ get_diagnostic_label() },
		{ " ", get_git_diff() },
		{ "", vim.fn.line("."), "/", vim.fn.charcol(".") },
		{ " " .. filename .. "", gui = vim.bo[props.buf].modified and "bold,italic" or "bold" },
		{ " 󱑆 ", wakatime.wakatime() },
	}
end

return {
	"b0o/incline.nvim",
	opts = {
		render = render,
	},
	config = function(_, opts)
		require("incline").setup(opts)
	end,
	-- Optional: Lazy load Incline
	event = "VeryLazy",
}
