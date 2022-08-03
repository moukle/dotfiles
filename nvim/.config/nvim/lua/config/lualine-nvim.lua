local lualine = require 'lualine'

lualine.setup {
	options = {
        globalstatus = true,
		icons_enabled = true,
		component_separators = '',
		section_separators = { left = '', right = '' },
	},
	sections = {
		lualine_a = { {'mode', separator = { left = ' ', right = '' }, fmt = function(str) return str:sub(1,1) end}, },
		-- lualine_b = { {'filename', file_status = true, separator = {left = ' '} } },
		lualine_b = { {'branch', } },
        lualine_c = {},
		lualine_x = {},
		--lualine_y = { 'filetype', 'progress' },
		lualine_y = {},
		lualine_z = { 'progress' , { 'location', separator = { right = ' ' }, left_padding = 2 }, },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = { { 'filename', separator = { left = ' ', right = ' ' }, left_padding = 2 }, },
		lualine_c = {},
		lualine_x = {},
		lualine_x = {},
		lualine_y = { { 'location', separator = { left = ' ', right = ' ' }, left_padding = 2 }, },
	},
    tabline = {
        lualine_a = {
            {
                'buffers',
                buffers_color = {
                    -- Same values as the general color option can be used here.
                    active = 'DiagnosticWarning',     -- Color for active buffer.
                    -- inactive = 'ErrorMsg', -- Color for inactive buffer.
                }
            }
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {'tabs'}
    },
	-- tabline = {},
	extensions = {},
}

