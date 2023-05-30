---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>pp"] = { "<cmd> Telescope projects <cr>", "Open Projects", opts = { nowait = true } },
    ["<leader>gg"] = { "<cmd> Neogit <cr>", "Open Neogit", opts = { nowait = true } },
    ["<leader>fr"] = { [[<cmd>Telescope oldfiles<cr>]], 'Recent', noremap = true },
  },
}

-- more keybinds!

return M
