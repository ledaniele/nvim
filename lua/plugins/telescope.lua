------------------------------
-- Plugin: telescope
------------------------------

return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
		},
		config = function()

			local actions = require("telescope.actions")

			require('telescope').setup({
				defaults = {
					preview = {
						treesitter = false
					},
					sorting_strategy = "ascending",
					initial_mode = "normal",
					layout_config = {
							horizontal = {
								prompt_position = "top",
								preview_width = 0.3,
						},
						width = 0.8,
						height = 0.85,
					},

					layout_strategy = "horizontal",

					mappings = {
						i = {
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
							["<C-x>"] = actions.select_horizontal,
							["<C-q>"] = actions.send_to_qflist,
						},
						n = {
							["q"] = actions.close,
							["<C-x>"] = actions.select_horizontal,
							["<C-q>"] = actions.send_to_qflist,
						},
					}
				},

				pickers = {
					buffers = {
						sort_mru = true,
						ignore_current_buffer = true,
						mappings = {
							i = {
								["<C-d>"] = actions.delete_buffer,
							},
							n = {
								["dd"] = actions.delete_buffer,
							},
						},
					},
				},

				extensions = {
					file_browser = {
						--theme="dropdown",
						previewer = true,
						initial_mode = "normal",
						sorting_strategy = "ascending",
						layout_config = {
							horizontal = {
								prompt_position = "top",
								previous_width = 0.3,
							},
						},	
							hijack_netrw = true,
						mappings = {
							["i"] = {
							},
							["n"] = {
							},
						},
					},
				},
			})
			require("telescope").load_extension("file_browser")
		end,
	},
}
