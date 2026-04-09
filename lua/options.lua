require('nvchad.options')

local opt = vim.opt

-- 编码
vim.o.encoding = 'utf-8'
vim.o.fileencoding = 'utf-8'
vim.o.fileencodings = 'ucs-bom,utf-8,gb18030,gbk,gb2312,cp936,latin1'
vim.o.termencoding = ''

-- 显示
opt.relativenumber = true
opt.cursorlineopt = 'both'
opt.textwidth = 80
opt.wrap = true

-- 自动读取外部修改（Aider 等工具改完代码后 Neovim 自动刷新）
opt.autoread = true

-- WSL 剪贴板
vim.g.clipboard = {
  name = 'WslClipboard',
  copy = {
    ['+'] = 'clip.exe',
    ['*'] = 'clip.exe',
  },
  paste = {
    ['+'] = 'pwsh.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    ['*'] = 'pwsh.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  },
  cache_enabled = 0,
}

-- 打开文件时恢复上次光标位置
vim.api.nvim_create_autocmd('BufReadPost', {
  pattern = '*',
  callback = function()
    local line = vim.fn.line('\'"')
    if
      line > 1
      and line <= vim.fn.line('$')
      and vim.bo.filetype ~= 'commit'
      and vim.fn.index({ 'xxd', 'gitrebase' }, vim.bo.filetype) == -1
    then
      vim.cmd('normal! g`"')
    end
  end,
})
