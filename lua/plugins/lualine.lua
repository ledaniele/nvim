------------------------------
-- Plugin: Lualine
------------------------------
 
return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()

			local colors = {
				-- catppuccin frappe
				red = '#de7e81',
				grey = '#404559',
				black = '#2f3446',
				white = '#303445', -- Catppuccin Frappe
--				white = '#1e1e2e', -- Catppuccin Mocha
				pink = '#ca9de6',
				green = '#a5d089',
				yellow = '#e1c58e',
				blue = '#8ca9ed',
				light_violet = '#85a0e0',
			}

			local theme = {
				normal = {
					a = { fg = colors.black, bg = colors.blue },
					b = { fg = colors.light_violet, bg = colors.grey },
					z = { fg = colors.black, bg = colors.blue },
				},
				insert = {
					a = { fg = colors.black, bg = colors.green },
					b = { fg = colors.green, bg = colors.grey },
					z = { fg = colors.black, bg = colors.green },
				},
				visual = {
					a = { fg = colors.black, bg = colors.pink },
					b = { fg = colors.pink, bg = colors.grey },
					z = { fg = colors.black, bg = colors.pink },
				},
				replace = {
					a = { fg = colors.black, bg = colors.yellow },
					b = { fg = colors.yellow, bg = colors.grey },
					z = { fg = colors.black, bg = colors.yellow },
				},
			}

			local empty = require('lualine.component'):extend()
			function empty:draw(default_highlight)
				self.status = ''
				self.applied_separator = ''
				self:apply_highlights(default_highlight)
				self:apply_section_separators()
				return self.status
			end

			-- Put proper separators and gaps between components in sections
			local function process_sections(sections)
				for name, section in pairs(sections) do
					local left = name:sub(9, 10) < 'x'
					for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
						table.insert(section, pos * 2, { empty, color = { fg = colors.white, bg = colors.white } })
					end
					for id, comp in ipairs(section) do
						if type(comp) ~= 'table' then
							comp = { comp }
							section[id] = comp
						end
						comp.separator = left and { right = '' } or { left = '' }
					end
				end
				return sections
			end

			local function search_result()
				if vim.v.hlsearch == 0 then
					return ''
				end
				local last_search = vim.fn.getreg('/')
				if not last_search or last_search == '' then
					return ''
				end
				local searchcount = vim.fn.searchcount { maxcount = 9999 }
				return last_search .. '(' .. searchcount.current .. '/' .. searchcount.total .. ')'
			end

			local function modified()
				if vim.bo.modified then
					return '+'
				elseif vim.bo.modifiable == false or vim.bo.readonly == true then
					return '-'
				end
				return ''
			end

			require('lualine').setup {
				options = {
					theme = theme,
					component_separators = '',
					section_separators = { left = '', right = '' },
					disabled_filetypes = {
						statusline = { "dashboard","alpha","starter"},
						winbar = { },
					},
				},
				sections = process_sections {
					lualine_a = { 'mode' },
					lualine_b = {
						'branch',
						{
							'diagnostics',
							source = { 'nvim' },
							sections = { 'error' },
							diagnostics_color = { error = { bg = colors.red, fg = colors.black } },
						},
						{
							'diagnostics',
							source = { 'nvim' },
							sections = { 'warn' },
							diagnostics_color = { warn = { bg = colors.yellow, fg = colors.black } },
						},
						{ 'filename', file_status = false, path = 1 },
						{ modified, color = { bg = colors.red, fg = colors.black } },
						{
							'%w',
							cond = function()
								return vim.wo.previewwindow
							end,
						},
						{
							'%r',
							cond = function()
								return vim.bo.readonly
							end,
						},
						{
							'%q',
							cond = function()
								return vim.bo.buftype == 'quickfix'
							end,
						},
					},
					lualine_c = {},
					lualine_x = {},
					lualine_y = { search_result, 'filetype' },
				},
				inactive_sections = {
					lualine_c = { '%f %y %m' },
					lualine_x = {},
				},
			}
		end,
	},
}
