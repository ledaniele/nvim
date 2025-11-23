------------------------------
-- Plugin: indent-blankline
------------------------------

return {
	{	
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			require("ibl").setup({
				indent = {
					char = "┃",
					tab_char = "┃",
			},
				scope = {
					enabled = true,
				},
				exclude = {
					filetypes = {
						"help",
						"alpha",
						"neo-tree",
				--		"lazy",
					},
				},
			})
		end,
	},
}
