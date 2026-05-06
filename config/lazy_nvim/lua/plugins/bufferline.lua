return {
  "akinsho/nvim-bufferline.lua",
  event = "BufReadPre",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("bufferline").setup {
      options = {
        diagnostics = "nvim_lsp",
        show_buffer_close_icons = false,
        show_close_icon = false,
        separator_style = { "|", " " },
        diagnostics_indicator = function(count, level)
          local icon = level:match "error" and " " or " "
          return " " .. icon .. count
        end,
      },
      highlights = {
        buffer_selected = {
          fg = "#fdf6e3",
          bold = true,
          italic = true,
        },
      },
    }
  end,
}
