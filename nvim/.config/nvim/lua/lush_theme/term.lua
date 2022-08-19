local lush = require 'lush'
local hsl = lush.hsl


-- Colors {{{
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
-- }}}

-- NeoVim Terminal {{{
-- vim.g.terminal_color_0 = '#262626'
-- vim.g.terminal_color_1 = '#767676'
-- vim.g.terminal_color_2 = '#4e4e4e'
-- vim.g.terminal_color_3 = '#a8a8a8'
-- vim.g.terminal_color_4 = '#444444'
-- vim.g.terminal_color_5 = '#8a8a8a'
-- vim.g.terminal_color_6 = '#949494'
-- vim.g.terminal_color_7 = '#bcbcbc'
-- vim.g.terminal_color_8 = '#4e4e4e'
-- vim.g.terminal_color_9 = '#9e9e9e'
-- vim.g.terminal_color_10 = '#808080'
-- vim.g.terminal_color_11 = '#e4e4e4'
-- vim.g.terminal_color_12 = '#666666'
-- vim.g.terminal_color_13 = '#b2b2b2'
-- vim.g.terminal_color_14 = '#c6c6c6'
-- vim.g.terminal_color_15 = '#eeeeee'
-- }}}

local theme = lush(function()
        return {
-- Vim Editor {{{
        Normal { bg = bg, fg = fg };
        Whitespace { fg = color0 };
        EndOfBuffer { fg = color0 };
        Conceal { Normal };
        Constant { fg = fg, gui = 'bold' };
        Character { Constant };
        String { fg = color6 };
        Number { fg = color6 };
        Float { fg = color6 };
        NormalFloat { bg = color0, fg = color8 };
        Boolean { Number };
        Identifier { fg = color7 };
        Function { fg = color3, gui='bold' };
        Statement { fg = color5, gui = 'bold' };
        Conditional { Statement };
        Repeat { Statement };
        Label { Statement };
        Exception { Statement };
        Operator { fg = fg };
        Keyword { fg = color7 };
        PreProc { fg = color7 };
        Include { PreProc };
        Define { PreProc };
        Macro { PreProc };
        PreCondit { PreProc };
        Type { fg = fg, gui = 'bold' };
        StorageClass { Type };
        Structure { Type };
        Typedef { Type };
        Special { fg = color7 };
        SpecialChar { Special };
        Tag { Special };
        Delimiter { Special };
        Debug { Special };
        Question { Special };
        SpecialComment { fg = color15, gui = 'bold' };
        Title { fg = color15, gui = 'bold' };
        Todo { fg = bg, bg=color1 };
        Comment { fg = color8, gui = 'italic' };
        LineNr { fg = color8 };
        Folded { fg = color8, gui = 'italic', bg = color0};
        FoldColumn { fg = color8 };
        SignColumn { fg = color7 };
        ColorColumn { bg = color8 };
        CursorLine { bg = color0 };
        CursorColumn { CursorLine };
        CursorLineNr { LineNr, fg = color7, gui = 'bold' };
        Visual { bg = color8, fg = color15 };
        VisualNOS { Visual };
        Search { bg = color3, fg = bg };
        IncSearch { bg = fg, fg = bg, gui = 'bold' };
        SpellBad { fg = color1, gui = 'undercurl' };
        SpellCap { fg = color1, gui = 'undercurl' };
        SpellLocal { fg = color1, gui = 'undercurl' };
        SpellRare { fg = color3, gui = 'undercurl' };
        Error { fg = color1, gui = 'bold' };
        ErrorMsg { Error };
        ErrorMsg { fg = color1 };
        WarningMsg { fg = color3 };
        ModeMsg { bg=color0, fg = color7 };
        MoreMsg { bg = color0, fg = color7 };
        MatchParen { fg = color1, gui = 'bold' };
        Cursor { bg = color7 };
        Underlined { fg = color7, gui = 'underline' };
        SpecialKey { fg = color7 };
        NonText { fg = color7 };
        Directory { fg = color7 };
        Pmenu { bg=color0, fg = color7 };
        PmenuSbar { fg = color7 };
        PmenuThumb { bg = color7 };
        PmenuSel { bg = color8, fg = color15 };
        StatusLine { Normal , fg = color7 };
        TabLineSel { StatusLine };
        StatusLineNC { StatusLine, fg = bg };
        TabLine { StatusLineNC };
        TabLineFill { StatusLineNC };
        WildMenu { fg = color7 };
        VertSplit { fg = color8 };
        DiffAdd { bg = color2, fg = bg };
        DiffChange { bg = color4, fg = bg };
        DiffDelete { bg = color1, fg = bg };
        DiffText { bg = color3, fg = bg };
        DiffAdded { fg = color2 };
        DiffChanged { fg = color4 };
        DiffRemoved { fg = color1 };
-- }}}
-- Treesitter {{{
        TSComment { Comment, gui = 'italic' };
        TSPunctDelimiter { Delimiter };
        TSPunctBracket { Delimiter };
        TSPunctSpecial { Delimiter };
        TSConstant { Constant };
        TSConstBuiltin { Special };
        TSConstMacro { Define };
        TSString { String };
        TSStringRegex { String };
        TSStringEscape { SpecialChar };
        TSCharacter { Character };
        TSNumber { Number };
        TSBoolean { Boolean };
        TSFloat { Float };
        TSFunction { Function };
        TSFuncBuiltin { Special };
        TSFuncMacro { Macro };
        TSParameter { Identifier, gui = 'italic' };
        TSParameterReference { TSParameter };
        TSMethod { Function };
        TSField { Identifier };
        TSProperty { Identifier, gui = 'italic' };
        TSConstructor { Special };
        TSAnnotation { PreProc };
        TSAttribute { PreProc };
        TSNamespace { Include };
        TSConditional { Conditional };
        TSRepeat { Repeat };
        TSLabel { Label };
        TSOperator { Operator };
        TSKeyword { Keyword, gui = 'italic' };
        TSKeywordFunction { Keyword };
        TSKeywordOperator { TSOperator };
        TSException { Exception };
        TSType { Type };
        TSTypeBuiltin { Type };
        TSInclude { Include };
        TSVariable { fg = Normal.fg, gui = 'italic'};
        TSVariableBuiltin { Special };
        TSText { fg = Normal.fg };
        TSStrong { TSText, gui = 'bold' };
        TSEmphasis { TSText, gui = 'italic' };
        TSUnderline { TSText, gui = 'underline' };
        TSTitle { Title };
        TSLiteral { String };
        TSURI { Underlined };
        TSTag { Label };
        TSTagDelimiter { Delimiter };
        TSPlaygroundFocus { Visual };

-- Refactor {{{
        TSDefinitionUsage { fg = color15, gui= 'bold' };
        TSDefinition { fg = color5, gui= 'bold' };
-- }}}

-- }}}
-- LSP {{{
        LspDiagnosticsDefaultHint { fg = color7 };
        LspDiagnosticsVirtualTextHint { LspDiagnosticsDefaultHint, gui = 'italic' };
        LspDiagnosticsFloatingHint { LspDiagnosticsDefaultHint };
        LspDiagnosticsSignHint { LspDiagnosticsDefaultHint };
        LspDiagnosticsUnderlineHint { LspDiagnosticsDefaultHint, gui = 'italic' };

        LspDiagnosticsDefaultError { fg = color1 };
        LspDiagnosticsVirtualTextError { LspDiagnosticsDefaultError, gui = 'italic' };
        LspDiagnosticsFloatingError { LspDiagnosticsDefaultError };
        LspDiagnosticsSignError { LspDiagnosticsDefaultError };
        LspDiagnosticsUnderlineError { LspDiagnosticsDefaultError, gui = 'italic' };

        LspDiagnosticsDefaultWarning { fg = color3 };
        LspDiagnosticsVirtualTextWarning { LspDiagnosticsDefaultWarning, gui = 'italic' };
        LspDiagnosticsFloatingWarning { LspDiagnosticsDefaultWarning };
        LspDiagnosticsSignWarning { LspDiagnosticsDefaultWarning };
        LspDiagnosticsUnderlineWarning { LspDiagnosticsDefaultWarning, gui = 'italic' };

        LspDiagnosticsDefaultInformation { fg = color2 };
        LspDiagnosticsVirtualTextInformation { LspDiagnosticsDefaultInformation, gui = 'italic' };
        LspDiagnosticsFloatingInformation { LspDiagnosticsDefaultInformation };
        LspDiagnosticsSignInformation { LspDiagnosticsDefaultInformation };
        LspDiagnosticsUnderlineInformation { LspDiagnosticsDefaultInformation, gui = 'italic' };
-- }}}
-- Lsp Saga {{{
-- Misc
        LspFloatWinBorder { fg = color8 };
        LspSagaBorderTitle { fg = color7, gui = 'bold' };
        TargetWord { fg = color15 };
        TargetFileName { fg = color15 };
        ProviderTruncateLine { fg = color8 };
        SagaShadow { fg = color1 };
        LspSagaFinderSelection { fg = color7 };
-- Diagnostic
        LspLinesDiagBorder { bg=color0, fg = color8 };
        DiagnosticTruncateLine { bg=color0, fg = color8 };
        DiagnosticError { bg = color0, fg=color1 };
        DiagnosticWarning {  bg = color0, fg=color7 };
        DiagnosticInformation { bg=color0, fg=fg };
        DiagnosticHint { bg=color0, fg=fg };
        LspSagaShTruncateLine { bg=color0, fg = color8 };
        LspSagaDocTruncateLine { bg=color0, fg = color8 };
        LineDiagTuncateLine { bg=color0, fg = color8 };
-- Code Action
        LspSagaCodeActionTitle { fg = color7 };
        LspSagaCodeActionTruncateLine { fg = color8 };
        LspSagaCodeActionContent { fg = color7 };
        LspSagaCodeActionBorder { fg = color8 };
-- Rename
        LspSagaRenamePromptPrefix { fg = color7 };
        LspSagaRenameBorder { fg = color8 };
-- Hover
        LspSagaHoverBorder { fg = color8 };
        LspSagaSignatureHelpBorder { fg = color8 };
        LspSagaAutoPreview { fg = color7 };
-- Definition
        LspSagaDefPreviewBorder { fg = color8 };
        DefinitionPreviewTitle { fg = color7 };
        ReferencesCount { fg = color7 };
        DefinitionCount { fg = color7 };
        DefinitionIcon { fg = color7 };
        ReferencesIcon { fg = color7 };
-- }}}
-- Lsp Lightbulb {{{
        LightBulbFloatWin { bg = color2, fg = bg };
        LightBulbVirtualText { fg = color2 };
-- }}}
-- Neogit {{{
        NeogitNotificationInfo    { fg = fg };
        NeogitNotificationWarning { fg = color3 };
        NeogitNotificationError   { fg = color1 };
-- }}}
-- Telescope {{{
        TelescopeBorder         { bg=color0, fg = color0 };
        TelescopePromptBorder   { bg=color8, fg = color8 };

        TelescopePromptNormal   { bg=color8, fg = fg };
        TelescopePromptPrefix   { bg=color8, fg = color15 };

        TelescopeNormal         { bg=color0, fg = color7 };

        TelescopePreviewTitle   { bg=color0, fg = color7 };
        TelescopePromptTitle    { bg=color8, fg = fg };
        TelescopeResultsTitle   { bg=color0, fg = color8 };

        TelescopeSelection      { bg=color8, fg = color15, gui="bold" };
        TelescopeSelectionCaret { bg=color0, fg = color0 };
        TelescopeMatching       { fg = color15, gui="bold" };
-- }}}
-- Headline {{{
        CodeBlock { bg=color0  };
        Headline  { bg=color0, fg=color15};
        Dash      { bg=bg,     fg=color8 };
-- }}}
-- Indent Blankline {{{
    IndentBlanklineChar { fg = color0 };
--}}}
-- Cmp {{{
        -- The abbr field.
        CmpItemAbbr { bg=color0, fg=fg };

        -- The deprecated item's abbr field.
        CmpItemAbbrDeprecated { Error };

        -- The matched characters highlight.
        CmpItemAbbrMatch { bg=color0, fg=color15, gui='bold' };

        -- The fuzzy matched characters highlight.
        CmpItemAbbrMatchFuzzy { bg=color0, fg=color15, gui='bold' };

        -- The kind field.
        CmpItemKind { bg=color0, fg = color15 };

        -- The menu field.
        CmpItemMenu { bg=color0, fg = color8 };
--}}}
-- Window Switcher {{{
    -- NvimWindoSwitch   { bg = color8, fg = color15, gui=bold };
    -- NvimWindoSwitchNC { bg = color0, fg = fg, gui=bold };
-- }}}
-- Ufo {{{
    -- UfoFoldedBg       { bg = color0, fg = color7};
    -- UfoFoldedFg       { bg = color0, fg = color7};
    -- UfoPreviewSbar    { bg = color0, fg = color7};
    -- UfoPreviewThumb   { bg = color0, fg = color7};
    -- UfoFoldedEllipsis { bg = color0, fg = color7};
-- }}}
}
end)

return theme

-- vim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}
