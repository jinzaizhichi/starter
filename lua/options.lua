require('nvchad.options')

-- add yours here!
local opt = vim.opt
-- 强制使用 UTF-8
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

-- 自动识别编码序列（增加对 GBK 等中文编码的识别）
opt.fileencodings = 'ucs-bom,utf-8,gbk,cp936,gb18030,big5,latin1'
local o = vim.o
opt.relativenumber = true
o.cursorlineopt = 'both' -- to enable cursorline!
o.textwidth = 80
o.wrap = true
--o.formatoptions:append('t')
-- 缺省行号为relativenumber
-- o.ruler = true
-- o.clipboard = "unnamedplus"
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

local autocmd = vim.api.nvim_create_autocmd

autocmd('BufReadPost', {
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
