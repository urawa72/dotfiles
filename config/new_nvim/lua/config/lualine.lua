local M = {}

-- Color table for highlights
-- local colors = {
-- 	bg = "#202328",
-- 	fg = "#bbc2cf",
-- 	yellow = "#ECBE7B",
-- 	cyan = "#008080",
-- 	darkblue = "#081633",
-- 	green = "#98be65",
-- 	orange = "#FF8800",
-- 	violet = "#a9a1e1",
-- 	magenta = "#c678dd",
-- 	blue = "#51afef",
-- 	red = "#ec5f67",
-- }

-- local function separator()
-- 	return "%="
-- end

function M.setup()
	-- local gps = require("nvim-gps")

	require("lualine").setup({
		options = {
			icons_enabled = true,
			theme = "auto",
			component_separators = { left = "", right = "" },
			section_separators = { left = " ", right = "" },
			disabled_filetypes = {},
			always_divide_middle = true,
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = {
				"branch",
				"diff",
				{
					"diagnostics",
					sources = { "nvim_diagnostic" },
					symbols = { error = " ", warn = " ", info = " ", hint = " " },
					colored = false,
				},
			},
			-- lualine_c = {
			-- 	{ separator },
			-- 	{
			-- 		gps.get_location,
			-- 		cond = gps.is_available,
			-- 		color = { fg = colors.green },
			-- 	},
			-- },
			lualine_x = { "filename", "encoding", "fileformat", "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		extensions = {},
	})
end

return M
