return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = "BufReadPre",
  opts = {
    indent = { char = "┊" },
    exclude = {
      filetypes = { "help", "lazy" },
      buftypes = { "terminal", "nofile" },
    },
  },
}
