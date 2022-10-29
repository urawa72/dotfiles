return {
  setup = function()
    require("fzf-lua").setup { winopts = {
      height = 0.4,
      width = 1.0,
      row = 1.0,
    } }
  end,
}
