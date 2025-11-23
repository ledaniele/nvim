------------------------------
-- Plugin: bufferline
------------------------------

return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"echasnovski/mini.bufremove",
			"catppuccin/nvim",
		},
		config = function()
			local bufferline = require("bufferline")

			bufferline.setup({
				options = {
					close_command = function(n)
						require("mini.bufremove").delete(n, false)
					end,
					right_mouse_command = function(n)
						require("mini.bufremove").delete(n, false)
					end,
					
					hover = {
						enabled = true,
						delay = 150,
						reveal = {"close"}
					},
					separator_style = "slope",
					--separator_style = "slant",
					always_show_bufferline = false,
					
					offsets = {
						{
							text = "File explorer",
							highlight = "Directory",
							text_align = "left",
						},
					},
				},
				highlights = {
					fill = {
						bg = "#1e2030",
					},
					background = {
						fg = "#6e738d",
						bg = "#24273a",
					},
					buffer_selected = {
						fg = "#cad3f5",
						bg = "#303446",
						bold = true,
					},
					buffer_visible = {
						fg = "#cad3f5",
						bg = "#303446",
					},
					separator = {
						bg = "#24273a",
						fg = "#1e2030",
					},
					separator_selected = {
						fg = "#1e2030",
						bg = "#303446",
					},
					separator_visible = {
						fg = "#1e2030",
						bg = "#24273a",
					},
					close_button = {
						fg = "#6e738d",
						bg = "#1e2030",
					},
					close_button_visible = {
						fg = "#6e738d",
						bg = "#1e2030",
					},
					close_button_selected = {
						fg = "#ed8796",
						bg = "#303446",
					},
					indicator_selected = {
						fg = "#8aadf4",
						bg = "#24273a",
					},
				},
			})
		end,
	},
}
