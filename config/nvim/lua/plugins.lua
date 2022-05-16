vim.cmd[[packadd packer.nvim]]

require'packer'.startup(function()
  -- 起動時に読み込むプラグインは名前を書くだけです
  use'tpope/vim-fugitive'
  use'tpope/vim-repeat'
  use'wbthomason/packer.nvim'
  use'neovim/nvim-lspconfig'
  use'williamboman/nvim-lsp-installer'
  use'simrat39/rust-tools.nvim'

  -- コマンドを叩いたときに読み込む。
  use{'rhysd/git-messenger.vim', opt = true, cmd = {'GitMessenger'}}

  -- 特定のイベントで読み込む
  use{'tpope/vim-unimpaired', opt = true, event = {'FocusLost', 'CursorHold'}}

  -- 条件が真の時のみ読み込みます。条件は起動時に毎回判定されます。
  use{
    'thinca/vim-fontzoom',
    cond = [[vim.fn.has'gui' == 1]], -- GUI の時のみ読み込む。
    -- 関数も指定できます。
    -- conf = function() return vim.fn.has'gui' == 1 end,
  }
end)

vim.cmd[[autocmd BufWritePost plugins.lua PackerCompile]]
