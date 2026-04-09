require('nvchad.autocmds')

-- 配合 autoread，检测文件是否被外部修改（Aider 等工具改完后自动刷新）
vim.api.nvim_create_autocmd({ 'BufEnter', 'CursorHold', 'CursorHoldI', 'FocusGained' }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = '*',
})

-- 进入终端模式时自动开启插入模式
vim.api.nvim_create_autocmd('TermOpen', {
  command = 'startinsert',
})
