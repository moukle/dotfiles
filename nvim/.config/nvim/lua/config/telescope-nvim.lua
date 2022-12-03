local ok, telescope = pcall(require, "telescope")
if not ok then
    return
end
local actions = require "telescope.actions"
local layout_actions = require "telescope.actions.layout"

telescope.setup {
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
            -- "--glob=!.git/",
        },
        prompt_prefix = " ",
        selection_caret = "  ",
        entry_prefix = "  ",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        color_devicons = true,
        file_ignore_patterns = {'.git/', 'node_modules/%', '%.ppm'},
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
        mappings = {
            i = {
                ["<C-w>"] = function()
                    vim.api.nvim_input "<c-s-w>"
                end,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-p>"] = actions.cycle_history_prev,
                ["<C-n>"] = actions.cycle_history_next,
                ["<C-l>"] = layout_actions.toggle_preview,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                ["<Esc>"] = actions.close,
                ["<Tab>"] = actions.toggle_selection + actions.move_selection_next,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_previous,
            },
        },
        extensions = {
            fzf = {
                fuzzy = true,                   -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true,    -- override the file sorter
                case_mode = 'smart_case'        -- or "ignore_case" or "respect_case"
            },
            file_browser = {
                mappings = {
                    -- <A-c>/c	create	Create file/folder at current path (trailing path separator creates folder)
                    -- <S-CR>	create_from_prompt	Create and open file/folder from prompt (trailing path separator creates folder)
                    -- <A-r>/r	rename	Rename multi-selected files/folders
                    -- <A-m>/m	move	Move multi-selected files/folders to current path
                    -- <A-y>/y	copy	Copy (multi-)selected files/folders to current path
                    -- <A-d>/d	remove	Delete (multi-)selected files/folders
                    -- <C-o>/o	open	Open file/folder with default system application
                    -- <C-g>/g	goto_parent_dir	Go to parent directory
                    -- <C-e>/e	goto_home_dir	Go to home directory
                    -- <C-w>/w	goto_cwd	Go to current working directory (cwd)
                    -- <C-t>/t	change_cwd	Change nvim's cwd to selected folder/file(parent)
                    -- <C-f>/f	toggle_browser	Toggle between file and folder browser
                    -- <C-h>/h	toggle_hidden	Toggle hidden files/folders
                    -- <C-s>/s	toggle_all	Toggle all entries ignoring ./ and ../
                    ["i"] = {
                    },
                    ["n"] = {
                    },
                },
            },
        }
    }
}

telescope.load_extension 'fzf'
telescope.load_extension 'projects'
telescope.load_extension 'file_browser'
