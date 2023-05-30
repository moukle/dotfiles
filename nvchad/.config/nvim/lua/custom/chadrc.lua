---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "everforest_light",
  theme_toggle = { "everforest_light", "melange" },
  statusline = { theme = "minimal" },
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
