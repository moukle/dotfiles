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
    use 'karb94/neoscroll.nvim'
    use 'yamatsum/nvim-cursorline'
    use 'folke/todo-comments.nvim'
    -- use 'gelguy/wilder.nvim'
    use 'lewis6991/satellite.nvim'
    use 'stevearc/dressing.nvim'
    -- use 'savq/melange'
-- }}}
-- Editor {{{
	use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use { 'nvim-telescope/telescope-file-browser.nvim' }
	use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
    use 'sindrets/diffview.nvim'
	use 'ahmedkhalf/project.nvim'

    use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}

	use 'folke/which-key.nvim'

	use 'numToStr/Comment.nvim'
	use 'tpope/vim-repeat'
	use 'machakann/vim-sandwich'
	use 'junegunn/vim-easy-align'
    use { 'windwp/nvim-autopairs', after = 'nvim-cmp' }
    use 'elihunter173/dirbuf.nvim'
    -- use 'chentoast/marks.nvim'
    use 'ggandor/leap.nvim'
    use 'simnalamburt/vim-mundo'
    use { "s1n7ax/nvim-window-picker", tag = "v1.*" }

    use {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v2.x",
            requires = {
                "nvim-lua/plenary.nvim",
                "kyazdani42/nvim-web-devicons",
                "MunifTanjim/nui.nvim",
            },
    }

    -- use { 'eraserhd/parinfer-rust', run = 'cargo build --release' } -- useful for S-Expressions (lispy)
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

    use 'ray-x/lsp_signature.nvim'

    use 'j-hui/fidget.nvim'
    use 'folke/trouble.nvim'
    use 'lewis6991/hover.nvim'
    use 'stevearc/aerial.nvim'

    use 'rafamadriz/friendly-snippets'
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
    use { 'elkowar/yuck.vim', ft = {'yuck'} }
    -- use 'lukas-reineke/headlines.nvim'
-- }}}
-- Misc {{{
    use 'lambdalisue/suda.vim'
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
