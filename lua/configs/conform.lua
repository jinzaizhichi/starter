local options = {
  formatters_by_ft = {
    lua = { 'stylua' },
    css = { 'prettier' },
    html = { 'prettier' },
    javascript = { 'prettier' },
    typescript = { 'prettier' },
    javascriptreact = { 'prettier' },
    typescriptreact = { 'prettier' },
    json = { 'prettier' },
    markdown = { 'prettier' },
    yaml = { 'yamlfmt' },
    yml = { 'yamlfmt' },
    python = function(bufnr)
      if require('conform').get_formatter_info('ruff_format', bufnr).available then
        return { 'ruff_format' }
      else
        return { 'isort', 'black' }
      end
    end,
    ['*'] = { 'codespell' },
    ['_'] = { 'trim_whitespace' },
  },

  default_format_opts = {
    lsp_format = 'fallback',
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_format = 'fallback',
  },

  log_level = vim.log.levels.ERROR,
  notify_on_error = true,
  notify_no_formatters = true,
}

return options
