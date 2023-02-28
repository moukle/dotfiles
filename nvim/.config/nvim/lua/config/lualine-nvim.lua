vim.cmd [[ source $HOME/.cache/wal/colors-wal.vim ]]
local obsidian_theme = {
  normal = {
    a = { fg = vim.g.color7, bg = vim.g.color8 },
    b = { fg = vim.g.color4, bg = vim.g.color0 },
    c = { fg = vim.g.color4, bg = vim.g.color0 },
  },

  insert  = { a = { fg = vim.g.color8, bg = vim.g.color6 } },
  visual  = { a = { fg = vim.g.color7, bg = vim.g.color3 } },
  replace = { a = { fg = vim.g.color7, bg = vim.g.color1 } },

  inactive = {
    a = { fg = vim.g.color7, bg = vim.g.color0 },
    b = { fg = vim.g.color7, bg = vim.g.color0 },
    c = { fg = vim.g.color7, bg = vim.g.color0 },
  },
}

local nvim_tree_shift =  {
  function ()
    return string.rep(' ',
            vim.api.nvim_win_get_width(require'nvim-tree.view'.get_winnr()) - 1)
  end,
  cond = require('nvim-tree.view').is_visible,
  color = 'NvimTreeNormal'
}

require'lualine'.setup {
	options = {
        globalstatus = true,
        theme = obsidian_theme,
		icons_enabled = true,
		component_separators = '',
		section_separators = { left = '', right = '' },
        disabled_filetypes = { "NvimTree", "TelescopePrompt", "packer", "toggleterm" },
	},
	sections = {
        lualine_a = { nvim_tree_shift, {'mode', separator = { right = '' } } },
        lualine_b = {
            {
                'filetype',
                colored = false,
                -- color = { bg = 'String', fg = 'String' },
                icon_only = true,
            },
        },
		lualine_c = { {'filename', file_status = true  } },
        lualine_x = { },
        lualine_y = { 'progress' , { 'location', left_padding = 2 } },
        lualine_z = { {'branch', separator = { left='', right = '' } } },
	},
	inactive_sections = {
		lualine_a = { },
		lualine_b = { { 'filename', separator = { left = ' ', right = ' ' }, left_padding = 2 }, },
		lualine_c = { },
		lualine_x = { },
		lualine_x = { },
		lualine_y = { { 'location', separator = { left = ' ', right = ' ' }, left_padding = 2 }, },
	},
    tabline = {
        lualine_a = { nvim_tree_shift, 'buffers' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {'tabs'}
    },
	-- tabline = {},
	extensions = {},
}

