local ts = require 'nvim-treesitter.configs'
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

-- Parsers {{{
parser_config.org = {
  install_info = {
    url = 'https://github.com/milisims/tree-sitter-org',
    revision = 'f110024d539e676f25b72b7c80b0fd43c34264ef',
    files = {'src/parser.c', 'src/scanner.cc'},
  },
  filetype = 'org',
}
-- }}}

-- Treesitter {{{
ts.setup {
    ensure_installed = 'all',
    highlight = { enable = true },
    indent = { enable = true },
    autotag = { enable = true },
    additional_vim_regex_highlighting = {'org'},

-- Context Comments {{{
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
        config = {
            cuda = { __default = '// %s', __multiline = '/* %s */' }
        }
    }
--}}}
}
--- }}}

-- vim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}
