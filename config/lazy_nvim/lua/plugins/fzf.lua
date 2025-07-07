return {
  "ibhagwan/fzf-lua",
  event = "BufEnter",
  dependencies = {
    {
      "junegunn/fzf",
      build = "./install --all",
    },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("fzf-lua").setup({
      winopts = {
        height = 0.4,
        width = 1.0,
        row = 1.0,
      }
    })
  end,
}
