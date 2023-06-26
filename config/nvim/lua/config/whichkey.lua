local M = {}

function M.setup()
  local whichkey = require("which-key")
  local presets = require("which-key.plugins.presets")

  presets.operators["v"] = nil

  local conf = {
    window = {
      border = "single", -- none, single, double, shadow
      position = "bottom", -- bottom, top
    },
    plugins = {
      marks = false,
      registers = false,
      spelling = {
        enabled = false,
      },
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = false,
        nav = false,
        z = false,
        g = false,
      },
    },
  }

  local opts = {
    mode = "n", -- Normal mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  }

  local mappings = {
    ["D"] = "which_key_ignore",
    ["w"] = { "<cmd>update!<CR>", "Save" },
    ["e"] = { "<cmd>Neotree toggle float reveal_force_cwd<cr>", "Explorer" },
    ["g"] = { "<cmd>lua _lazygit_toggle()<CR>", "Git" },

    b = {
      name = "Buffer",
      c = { "<Cmd>bd!<Cr>", "Close Buffer" },
    },

    f = {
      name = "Find",
      f = { "<cmd>FzfLua files<cr>", "Files" },
      b = { "<cmd>FzfLua buffers<cr>", "Buffers" },
      o = { "<cmd>FzfLua oldfiles<cr>", "Old Files" },
      g = { "<cmd>FzfLua live_grep<cr>", "Live Grep" },
      c = { "<cmd>FzfLua commands<cr>", "Commands" },
    },

    z = {
      name = "Packer",
      c = { "<cmd>PackerCompile<cr>", "Compile" },
      i = { "<cmd>PackerInstall<cr>", "Install" },
      p = { "<cmd>PackerProfile<cr>", "Profile" },
      s = { "<cmd>PackerSync<cr>", "Sync" },
      S = { "<cmd>PackerStatus<cr>", "Status" },
      u = { "<cmd>PackerUpdate<cr>", "Update" },
    },

    l = {
      name = "LSP",
      g = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
      f = { "<cmd>lua vim.lsp.buf.format()<CR>", "Format" },
    },

    -- g = {
    --   name = "Git",
    --   s = { "<cmd>Neogit<CR>", "Status" },
    -- },
  }

  whichkey.setup(conf)
  whichkey.register(mappings, opts)
end

return M
