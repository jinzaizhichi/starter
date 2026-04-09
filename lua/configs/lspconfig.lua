require('nvchad.configs.lspconfig').defaults()

local servers = { 'html', 'cssls', 'ts_ls', 'pyright', 'ruff', 'yamlls' }
vim.lsp.enable(servers)
