return {
  "EdenEast/nightfox.nvim",
  config = function()
    require("nightfox").setup({
      options = {
        dim_inactive = true,
        transparent = true,
      },
      palettes = {
        nightfox = { red = "#c94f6d" },
        nordfox = { comment = "#60728a" },
      },
      specs = {
        nightfox = {
          syntax = { keyword = "magenta" },
        },
      },
      groups = {
        all = { IncSearch = { bg = "palette.cyan" } },
      },
    })
    vim.cmd.colorscheme("nightfox")
  end,
}
