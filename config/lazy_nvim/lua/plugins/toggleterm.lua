return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    -- ここでtoggleterm全体の設定
    size = 20,
    open_mapping = [[<c-\>]],
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "float", -- or "horizontal", "vertical", "tab"
    close_on_exit = true,
    shell = vim.o.shell,
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    -- Lazygit専用のターミナル定義
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({
      cmd = "lazygit",
      hidden = true,
      direction = "float",
      float_opts = {
        border = "curved",
      },
      on_open = function()
        vim.cmd("startinsert!")
      end,
      on_close = function()
        vim.cmd("startinsert!")
      end,
    })

    function LAZYGIT_TOGGLE()
      lazygit:toggle()
    end
  end,
}
