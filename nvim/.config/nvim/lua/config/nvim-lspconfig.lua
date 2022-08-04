local vim = vim
local lsp = vim.lsp
local cmd = vim.cmd

local nvim_lsp = require 'lspconfig'
local cmp_lsp = require 'cmp_nvim_lsp'

require 'fidget'.setup{}
require 'trouble'.setup{}
-- Handlers {{{
lsp.handlers['textDocument/publishDiagnostics'] =
    lsp.with(lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = false,
        signs = true,
        update_in_insert = true
    })
-- }}}

-- Signs {{{
cmd [[sign define LspDiagnosticsSignError text=┣ texthl=LspDiagnosticsSignError linehl= numhl=]]
cmd [[sign define LspDiagnosticsSignWarning text=┣ texthl=LspDiagnosticsSignWarning linehl= numhl=]]
cmd [[sign define LspDiagnosticsSignInformation text=┣ texthl=LspDiagnosticsSignInformation linehl= numhl=]]
cmd [[sign define LspDiagnosticsSignHint text=┣ texthl=LspDiagnosticsSignHint linehl= numhl=]]

cmd [[sign define DiagnosticSignError text=┣ texthl=LspDiagnosticsSignError linehl= numhl=]]
cmd [[sign define DiagnosticSignWarn text=┣ texthl=LspDiagnosticsSignWarning linehl= numhl=]]
cmd [[sign define DiagnosticSignInfo text=┣ texthl=LspDiagnosticsSignInformation linehl= numhl=]]
cmd [[sign define DiagnosticSignHint text=┣ texthl=LspDiagnosticsSignHint linehl= numhl=]]
-- }}}

local function CustomOnAttach(client, bufnr)
    lsp_status.on_attach(client)
end

local custom_capabilities = cmp_lsp.update_capabilities(lsp.protocol.make_client_capabilities())

-- C {{{
nvim_lsp.clangd.setup {
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
    capabilities = custom_capabilities
}
-- }}}

-- Julia {{{
nvim_lsp.julials.setup{
    root_dir = function(fname)
        return nvim_lsp.util.root_pattern 'Project.toml'(fname) -- or util.find_git_ancestor(fname)
    end,
}
-- }}}

-- Python
nvim_lsp.pyright.setup{}
-- }}}

-- vim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}
