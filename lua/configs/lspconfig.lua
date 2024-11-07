-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.ts_ls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}
-- python
lspconfig.pyright.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetype = { "python" },
  sigle_file_support = true,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true,
      },
    },
  },
}
-- Configure `ruff-lsp`.
-- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ruff_lsp
-- For the default config, along with instructions on how to customize the settings
require("lspconfig").ruff.setup {
  init_options = {
    settings = {
      -- Any extra CLI arguments for `ruff` go here.
      args = {},
    },
  },
}

-- local configs = require "nvchad.configs.lspconfig"
--
-- local servers = {
--   html = {},
--   awk_ls = {},
--   bashls = {},
--
--   ruff_lsp = {
--     init_options = {
--       settings = {
--         -- Any extra CLI arguments for `ruff` go here.
--         args = {},
--       },
--     },
--   },
--
--   pyright = {
--     settings = {
--       python = {
--         analysis = {
--           autoSearchPaths = true,
--           typeCheckingMode = "basic",
--         },
--       },
--     },
--   },
-- }
--
-- for name, opts in pairs(servers) do
--   opts.on_init = configs.on_init
--   opts.on_attach = configs.on_attach
--   opts.capabilities = configs.capabilities
--
--   require("lspconfig")[name].setup(opts)
-- end
