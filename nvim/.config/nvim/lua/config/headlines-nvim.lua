local headlines = require('headlines')
local vim = vim

vim.fn.sign_define("Headline1", { linehl = "Headline1" })
vim.fn.sign_define("Headline2", { linehl = "Headline2" })

headlines.setup {
    org = {
        headline_signs = { "Headline1", "Headline2" },
    },
}
