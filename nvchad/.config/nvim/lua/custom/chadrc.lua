---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "doomchad",
  theme_toggle = { "doomchad", "doomchad" },
  statusline = { theme = "minimal", separator_style = "round" }
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
