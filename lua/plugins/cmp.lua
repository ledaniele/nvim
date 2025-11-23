------------------------------
-- Plugin: nvim-cmp
------------------------------

return {
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			cmp.setup({
			snippet = {
				expand = function(args)
				luasnip.lsp_expand(args.body)
				end,
				},

				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),

					-- Manually trigger completion menu
					["<C-Space>"] = cmp.mapping.complete(),

					-- Abort completion
					["<C-e>"] = cmp.mapping.abort(),

					-- Confirm selection
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					-- select = true means: if nothing is explicitly chosen, take the first item.
				}),

				sources = cmp.config.sources({
					{ name = "nvim_lsp" },   -- completions coming from LSP (clangd, lua_ls, etc.)
					{ name = "luasnip" },    -- expand snippet bodies when LSP suggests them
				}, {
					{ name = "buffer" },     -- words from current buffer
					{ name = "path" },       -- filesystem paths
				}),

				formatting = {
					format = function(entry, vim_item)
					-- Add a little menu tag to each completion item so you know where it came from
					vim_item.menu = ({
						nvim_lsp = "[LSP]",
						luasnip  = "[Snip]",
						buffer   = "[Buf]",
						path     = "[Path]",
					})[entry.source.name] or ""
					return vim_item
					end,
				},
			})
		end,
	},
}

