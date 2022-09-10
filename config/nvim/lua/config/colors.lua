if vim.fn.has "termguicolors" == 1 then
  vim.opt.termguicolors = true
end

vim.cmd [[
autocmd ColorScheme * highlight Normal ctermbg=none guibg=none
autocmd ColorScheme * highlight NonText ctermbg=none guibg=none
autocmd ColorScheme * highlight LineNr ctermbg=none guibg=none
autocmd ColorScheme * highlight Folded ctermbg=none guibg=none
autocmd ColorScheme * highlight EndOfBuffer ctermbg=none guibg=none
autocmd ColorScheme * highlight! link FloatBorder NormalFloat
highlight LspReferenceText  ctermbg=8 guibg=#206050
highlight LspReferenceRead  ctermbg=8 guibg=#206050
highlight LspReferenceWrite ctermbg=8 guibg=#206050
]]

local options = {
  dim_inactive = true,
  transparent = true,
}
local palettes = {
  nightfox = {
    red = "#c94f6d",
  },
  nordfox = {
    comment = "#60728a",
  },
}
local specs = {
  nightfox = {
    syntax = {
      keyword = "magenta",
    },
  },
}
local groups = {
  all = {
    IncSearch = { bg = "palette.cyan" },
  },
}
require("nightfox").setup {
  options = options,
  palettes = palettes,
  specs = specs,
  groups = groups,
}

vim.cmd "colorscheme nightfox"
