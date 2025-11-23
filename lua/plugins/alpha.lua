------------------------------
-- Plugin: alpha
------------------------------

return {
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			dashboard.section.header.val = {

				[[   ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
				[[   ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
				[[   ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
				[[   ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
				[[   ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
				[[   ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],

			}

			dashboard.section.buttons.val = {
				dashboard.button("n", "  New File", ":ene <BAR> startinsert <CR>"),
				dashboard.button("e", "󰙅  File Explorer", ":Telescope file_browser<CR>"),
				dashboard.button("r", "󰅒  Recent Files", ":Telescope oldfiles<CR>"),
				dashboard.button("f", "󰈞  Find File", ":Telescope find_files<CR>"),
				dashboard.button("l", "󰒲  Lazy Manager", ":Lazy <CR>"),
				dashboard.button("m", "  Mason", ":Mason<CR>"),
				dashboard.button("q", "󰗼  Quit Neovim", ":qa<CR>"),
			}


			local function footer()
				return "(2025) Config by Daniele Turazzini - v2.0"
			end

			dashboard.section.footer.val = footer()

			dashboard.section.footer.opts.hl = "Type"
			dashboard.section.header.opts.hl = "Include"
			dashboard.section.buttons.opts.hl = "Keyword"
			dashboard.position = "center"

			dashboard.opts.opts.noautocmd = true
			alpha.setup(dashboard.opts)
		end,
	},
}
