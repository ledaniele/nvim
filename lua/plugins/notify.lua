------------------------------
-- Plugin: notify
------------------------------

return {
	{
		"rcarriga/nvim-notify",
		lazy = false,        -- load immediately, not later
		priority = 1000,     -- load before almost everything else
		config = function()
			local notify = require("notify")
			notify.setup({
      --	Frappe  : "#303446"
      --	Macchiato: "#24273a"
      --	Mocha   : "#1e1e2e"
				background_colour = "#303446",
			})
			vim.notify = notify
		end,
	},
}
