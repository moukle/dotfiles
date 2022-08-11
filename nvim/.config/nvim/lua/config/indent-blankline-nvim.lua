local ok, indent_blankline = pcall(require, "indent_blankline")
if not ok then
    return
end

indent_blankline.setup {
    -- char = '│',
    char_list = {'│', '┆'},
    use_treesitter = true,
    --show_trailing_blankline_indent = false,
    show_current_context = true,
    show_current_context_start = true,
    --max_indent_increase = 1,
    buftype_exclude = { 'terminal', 'nofile' },
    filetype_exclude = { 'help', 'packer', 'startify' }
}
