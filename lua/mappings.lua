require "nvchad.mappings"

local map = vim.keymap.set

-- ============================================================
-- 基础与编辑增强
-- ============================================================
map("n", ";", ":", { desc = "进入命令行模式" })
map("i", "jk", "<ESC>", { desc = "退出插入模式" })

-- 快速保存与退出
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR>", { desc = "保存文件" })
map("n", "<leader>q", "<cmd>confirm q<CR>", { desc = "退出窗口" })
map("n", "<leader>Q", "<cmd>confirm qa<CR>", { desc = "退出所有窗口" })

-- 搜索高亮清除
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "清除搜索高亮" })

-- 选中文本上下移动（保持选中状态）
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "向下移动选中文本" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "向上移动选中文本" })

-- 连续缩进不丢失选中状态
map("v", "<", "<gv", { desc = "向左缩进" })
map("v", ">", ">gv", { desc = "向右缩进" })

-- 粘贴时不覆盖寄存器（保留复制内容）
map("x", "p", [["_dP]], { desc = "无污染粘贴" })

-- 系统剪贴板复制
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "复制到系统剪贴板" })
map("n", "<leader>Y", [["+Y]], { desc = "整行复制到系统剪贴板" })

-- ============================================================
-- 窗口分割与导航
-- ============================================================
-- 分割窗口
map("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "垂直分屏" })
map("n", "<leader>sh", "<cmd>split<CR>", { desc = "水平分屏" })
map("n", "<leader>se", "<C-w>=", { desc = "重置分屏等宽等高" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "关闭当前分屏" })

-- 调整窗口大小
map("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "增加窗口高度" })
map("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "减少窗口高度" })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "减少窗口宽度" })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "增加窗口宽度" })

-- ============================================================
-- 标签页 / Buffer 管理
-- ============================================================
map("n", "<Tab>", "<cmd>bnext<CR>", { desc = "下一个 Buffer" })
map("n", "<S-Tab>", "<cmd>bprevious<CR>", { desc = "上一个 Buffer" })
map("n", "<leader>x", "<cmd>bdelete<CR>", { desc = "关闭当前 Buffer" })

-- ============================================================
-- 终端与 Git
-- ============================================================
-- 终端模式下直接切回普通模式
map("t", "<C-x>", "<C-\\><C-N>", { desc = "终端返回 Normal 模式" })

-- lazygit 浮动终端
map("n", "<leader>gg", function()
  local ok, Terminal = pcall(function()
    return require("toggleterm.terminal").Terminal
  end)
  if not ok then
    vim.notify("Toggleterm 未加载或未安装", vim.log.levels.WARN)
    return
  end

  local lazygit = Terminal:new {
    cmd = "lazygit",
    direction = "float",
    float_opts = { border = "curved" },
    on_close = function()
      vim.cmd "checktime"
    end,
  }
  lazygit:toggle()
end, { desc = "打开 lazygit" })

-- ============================================================
-- LSP 与 诊断增强
-- ============================================================
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP 重命名变量" })
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "查看行错误详情" })

-- 诊断跳转（适配 Neovim 0.11+ API，带悬浮提示）
map("n", "[d", function()
  vim.diagnostic.jump { count = -1, float = true }
end, { desc = "上一个诊断/错误" })

map("n", "]d", function()
  vim.diagnostic.jump { count = 1, float = true }
end, { desc = "下一个诊断/错误" })

-- 仅跳转严重错误 (Error)
map("n", "[e", function()
  vim.diagnostic.jump { count = -1, float = true, severity = vim.diagnostic.severity.ERROR }
end, { desc = "上一个代码错误" })

map("n", "]e", function()
  vim.diagnostic.jump { count = 1, float = true, severity = vim.diagnostic.severity.ERROR }
end, { desc = "下一个代码错误" })

-- ============================================================
-- Markdown
-- ============================================================
map("n", "<leader>mp", "<cmd>MarkdownPreview<CR>", { desc = "Markdown 浏览器预览" })
map("n", "<leader>ms", "<cmd>MarkdownPreviewStop<CR>", { desc = "停止 Markdown 预览" })
map("n", "<leader>mt", "<cmd>MarkdownPreviewToggle<CR>", { desc = "切换 Markdown 预览" })
