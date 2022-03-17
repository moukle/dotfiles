-- Setup {{{
local vim = vim
local cmd = vim.cmd

cmd [[ packadd packer.nvim ]]
cmd [[ autocmd BufWritePost init.lua PackerCompile ]]

local packer = require 'packer'
local util = require 'packer.util'
-- }}}
-- Use Wrapper {{{
local function file_exists(filename)
    local config_path = vim.fn.expand( '~/.config/nvim/lua/config/' .. filename .. '.lua')
    local config_readable = vim.fn.filereadable(config_path) == 1
    return config_readable
end

local function use_wrapper(orig_use)
    return function(opts)
        local config_name
        if type(opts) == 'string' then
            config_name = opts:gsub('.*/(.*)', '%1'):gsub('%.', '-')
            if file_exists(config_name) then
                opts = {
                    opts,
                    config = [[require 'config/]] .. config_name .. [[']]
                }
            end
        end
        if type(opts) == 'table' and type(opts[1]) == 'string' then
            config_name = opts[1]:gsub('.*/(.*)', '%1'):gsub('%.', '-')
            if file_exists(config_name) then
                opts.config = [[require 'config/]] .. config_name .. [[']]
            end
        end
        orig_use(opts)
    end
end
--}}}

local function plugins(use)
-- Init {{{
	local use = use_wrapper(use)
	use { 'wbthomason/packer.nvim', opt = true }
	use 'antoinemadec/FixCursorHold.nvim'
-- }}}
-- UI {{{
	use 'kyazdani42/nvim-web-devicons'
	use 'nvim-lualine/lualine.nvim'
	use 'rktjmp/lush.nvim'
	use 'lukas-reineke/indent-blankline.nvim'
    use 'Pocco81/TrueZen.nvim'
-- }}}
-- Editor {{{
	use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
    use 'sindrets/diffview.nvim'
	use 'ahmedkhalf/project.nvim'

	use 'folke/which-key.nvim'

	use 'numToStr/Comment.nvim'
	use 'tpope/vim-repeat'
	use 'machakann/vim-sandwich'
	use 'junegunn/vim-easy-align'
-- }}}
-- LSP {{{
	use 'L3MON4D3/LuaSnip'
	use 'onsails/lspkind-nvim'

	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
-- }}}
-- Syntax {{{
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		requires = {
			'nvim-treesitter/playground',
			'nvim-treesitter/nvim-treesitter-textobjects',
			'nvim-treesitter/nvim-treesitter-refactor',
			'windwp/nvim-ts-autotag',
			'JoosepAlviste/nvim-ts-context-commentstring',
		}
	}
-- }}}
-- Lang {{{
    use 'JuliaEditorSupport/julia-vim'
    use 'nvim-orgmode/orgmode'
    -- use 'lukas-reineke/headlines.nvim'
-- }}}
end

-- Start Packer {{{
local config = {
    display = {
        open_fn = util.float
    }
}

packer.startup { plugins, config = config }
-- }}}

-- vim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}
