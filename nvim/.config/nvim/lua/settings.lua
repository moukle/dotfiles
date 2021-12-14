local vim = vim
local cmd = vim.cmd
local opt = vim.opt

-- UI {{{
opt.termguicolors = true
cmd [[colorscheme term]]

opt.number = true
opt.relativenumber = true

opt.fillchars = {eob = " " , vert = "┃", fold = " " }
opt.foldtext = [[v:lua.FoldText()]]
-- }}}
