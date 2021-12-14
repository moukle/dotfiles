local vim = vim
local cmd = vim.cmd
local opt = vim.opt

-- Temporary files {{{
opt.undofile = true
opt.undodir = vim.fn.stdpath('config') .. '/undo'

opt.backup = true
opt.backupcopy = 'auto'
opt.backupdir = vim.fn.stdpath('config') .. '/backup'

opt.swapfile = true
opt.directory = vim.fn.stdpath('config') .. '/swap'
-- }}}
-- UI {{{
opt.termguicolors = true
cmd [[colorscheme term]]

opt.number = true
opt.relativenumber = true

-- Show matching brackets when text indicator is over them
opt.showmatch = true
-- }}}
-- Folding {{{
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.fillchars = {eob = " " , vert = "┃", fold = " " }
opt.foldtext = [[v:lua.FoldText()]]
-- }}}
-- Search {{{
opt.ignorecase = true
opt.smartcase = true
-- }}}
-- Indentation {{{
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.smartindent = true

opt.list = true
opt.listchars = 'tab:│ ,trail:━'

opt.wrap = true
--}}}

-- vim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}
