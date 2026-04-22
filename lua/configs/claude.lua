return{
      require("claude-code").setup({
        -- 终端窗口设置
        window = {
          position = "vertical", -- 竖向分屏，也可以改成 "horizontal" 或 "float"
          split_ratio = 0.4,     -- 占屏幕宽度的 40%
        },
        -- 按键映射
        keymaps = {
          toggle = {
            normal = "<leader>cc",  -- 普通模式切换
            terminal = "<leader>cc", -- 终端模式切换
          },
          window_navigation = true,
          scrolling = true,
        },
      })
  }

