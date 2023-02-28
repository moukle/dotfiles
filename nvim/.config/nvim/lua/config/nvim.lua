
vim.cmd [[ source $HOME/.cache/wal/colors-wal.vim ]]

local bg = vim.g.background
local fg = vim.g.foreground
local cursor = vim.g.cursor
local color0 = vim.g.color0
local color1 = vim.g.color1
local color2 = vim.g.color2
local color3 = vim.g.color3
local color4 = vim.g.color4
local color5 = vim.g.color5
local color6 = vim.g.color6
local color7 = vim.g.color7
local color8 = vim.g.color8
local color9 = vim.g.color9
local color10 = vim.g.color10
local color11 = vim.g.color11
local color12 = vim.g.color12
local color13 = vim.g.color13
local color14 = vim.g.color14
local color15 = vim.g.color15


require("catppuccin").setup{
    flavour = "mocha",
    color_overrides = {
        all = {
            base = bg,
            text = fg,

            mantle = color0,
            crust = color0,

            surface0 = color8,
            surface1 = color4,
            surface2 = color5,

            overlay0 = color12,
            overlay1 = color13,
            overlay2 = color14,

            subtext0 = color14,
            subtext1 = color13,

            rosewater = color6,
            flamingo  = color14,
            pink      = color7,
            mauve     = color6,
            red       = color7,
            maroon    = color15,
            peach     = color6,
            yellow    = color14,
            green     = color7,
            teal      = color15,
            sky       = color15,
            sapphire  = color7,
            blue      = color15,
            lavender  = color14,
        },
    },
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = { "bold" },
        functions = { "bold" },
        keywords = { "bold" },
        strings = {},
        variables = {},
        numbers = { "bold" },
        booleans = { "bold" },
        properties = {},
        types = { "bold" },
        operators = { "bold" },
    },
    transparent_background = false,
    show_end_of_buffer = false,
    custom_highlights = function(colors)
        return {
            NormalFloat = { bg = colors.crust },
            FloatBorder = { bg = colors.crust, fg = colors.crust },
            VertSplit = { bg = colors.base, fg = colors.surface0 },
            CursorLineNr = { fg = colors.mauve, style = { "bold" } },
            Pmenu = { bg = colors.crust, fg = "" },
            PmenuSel = { bg = colors.surface0, fg = "" },
            TelescopeSelection = { bg = colors.surface0 },
            TelescopePromptCounter = { fg = colors.mauve, style = { "bold" } },
            TelescopePromptPrefix = { bg = colors.surface0 },
            TelescopePromptNormal = { bg = colors.surface0 },
            TelescopeResultsNormal = { bg = colors.mantle },
            TelescopePreviewNormal = { bg = colors.crust },
            TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
            TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
            TelescopePreviewBorder = { bg = colors.crust, fg = colors.crust },
            TelescopePromptTitle = { fg = colors.surface0, bg = colors.surface0 },
            TelescopeResultsTitle = { fg = colors.mantle, bg = colors.mantle },
            TelescopePreviewTitle = { fg = colors.crust, bg = colors.crust },
            IndentBlanklineChar = { fg = colors.crust },
            IndentBlanklineContextChar = { fg = colors.surface2 },
            GitSignsChange = { fg = colors.peach },
            NvimTreeIndentMarker = { link = "IndentBlanklineChar" },
            NvimTreeExecFile = { fg = colors.text },
            ["@keyword"] = { fg = "#D08770", style = { "bold" } },
            ["@keyword.return"] = { fg = "#D08770", style = { "bold" } },
            ["@keyword.export"] = { fg = "#D08770", style = { "bold" } },
        }
    end,
}

vim.cmd.colorscheme "catppuccin"
