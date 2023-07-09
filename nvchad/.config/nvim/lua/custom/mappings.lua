---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>pp"] = { "<cmd> Telescope projects <cr>", "Open Projects", opts = { nowait = true } },
    ["<leader>gg"] = { "<cmd> Neogit <cr>", "Open Neogit", opts = { nowait = true } },
    ["<leader>fr"] = { [[<cmd>Telescope oldfiles<cr>]], 'Recent', noremap = true },
    ["<leader>ff"] = { [[<cmd>Telescope find_files hidden=true<cr>]], 'Find Files', noremap = true },
    ["<leader>f."] = { [[<cmd>:lua require("telescope.builtin").find_files( { cwd = vim.fn.expand("%:p:h") })<cr>]], 'File ./', noremap = true},
  },
}

-- more keybinds!

return M
