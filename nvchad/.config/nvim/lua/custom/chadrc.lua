---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "ayu_light",
  theme_toggle = { "ayu_light", "melange" },
  statusline = { theme = "minimal" },
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
