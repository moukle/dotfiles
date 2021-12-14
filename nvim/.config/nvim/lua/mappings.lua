local vim = vim
local wk = require 'which-key'

vim.g.mapleader = ' '

-- Normal Mode {{{
wk.register({
    ['<leader>'] = {
-- File {{{
        f = {
            name = 'File',
            ['.'] = { [[<cmd>:lua require("telescope.builtin").find_files( { cwd = vim.fn.expand("%:p:h") })<cr>]], 'File ./', noremap = true},
            f = { [[<cmd>:lua require("telescope.builtin").find_files{ find_command = { "rg", "--files", "--hidden", "--ignore", "-g", "!.git/*" } }<cr>]], 'File', noremap = true },
            g = { [[<cmd>Telescope live_grep theme=ivy<cr>]], 'Grep', noremap = true },
            b = { [[<cmd>Telescope file_browser theme=ivy<cr>]], 'Browser', noremap = true },
            r = { [[<cmd>Telescope oldfiles theme=ivy<cr>]], 'Recent', noremap = true },
        },
-- }}}
-- Buffers {{{
        b = {
            name = 'Buffer',
            b = { [[<cmd>Telescope buffers theme=ivy<cr>]], 'Buffers', noremap = true },
        },
-- }}}
-- Project {{{
        p = {
            name = 'Project',
            p = { [[<cmd>Telescope projects theme=ivy<cr>]], 'Projects', noremap = true },
        },
-- }}}
-- Git {{{
        g = {
            name = 'Git',
            g = { [[<cmd>Neogit<cr>]], 'Neogit', noremap = true },
        },
-- }}}
    }
}, { mode = 'n' } )

--}}}

-- vim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}
