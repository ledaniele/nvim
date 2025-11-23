------------------------------
-- Plugin: which-key
------------------------------

return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			sort = { "manual" },
		},
		keys = {
			{ "<leader>a", "<cmd>Alpha<cr>", desc = "Alpha" },	
			{ "<leader>s", "<cmd>w!<cr>", desc = "Save File" },
			{
				"<leader>k",
				function()
					require("mini.bufremove").delete(0, false)
				end,
				desc = "Close File",
			},
			{ "<leader>e", "<cmd>Telescope file_browser<cr>", desc = "File Explorer" },
			{ "<leader>r", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
			{ "<leader>l", "<cmd>Lazy<cr>", desc = "Lazy" },
			{ "<leader>q", "<cmd>wqall!!<cr>", desc = "Quit Nvim" },
			{ "<leader>n", "<cmd>ene <bar> startinsert<cr>", desc = "New File" }, 
			{ "<leader>v", "<cmd>vsplit<cr>", desc = "Split Screen" },	
			{ "<leader>c", "<cmd>close<cr>", desc = "Close Active Split" },	
			{ "<leader>g", "<cmd>LazyGit<cr>", desc = "LazyGit" },
			{ "<leader>d", "<cmd>lua vim.diagnostic.setqflist()<cr>", desc = "Debug" },
			{ "<leader>m", "<cmd>Mason<cr>", desc = "Mason" },
			{ "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Terminal" },
			{ "<leader>th",
				function()
					vim.cmd("w")
					vim.cmd(
						"TermExec cmd=\"open -a Safari % \" go_back=0"
					)
				end,
				desc = "HTML",
			},
			{ "<leader>tc",
				function()
					vim.cmd("w")
					vim.cmd(
						"TermExec cmd=\"cd .. && make run\" go_back=0"
					)
				end,
				desc = "C++/Make",
			},
		},
	},
}
