local s = vim.keymap.set

s("i", "jj", "<Esc>", { silent = true })
s("n", "<S-q>", ":q!<CR>", { silent = true })
s("n", "<S-b>", ":bd!<CR>", { silent = true })
s("n", "<C-j>", ":bprev<CR>", { silent = true })
s("n", "<C-k>", ":bnext<CR>", { silent = true })
s("n", "<C-e>", "$", { silent = true })
s("n", "<C-a>", "^", { silent = true })
s("v", "<C-e>", "$", { silent = true })
s("v", "<C-a>", "^", { silent = true })
s("i", "<C-k>", "<Up>", { silent = true })
s("i", "<C-j>", "<Down>", { silent = true })
s("i", "<C-e>", "<C-o>$", { silent = true })
s("i", "<C-a>", "<C-o>^", { silent = true })
s("n", "<Esc><Esc>", ":nohlsearch<CR>", { silent = true })
s("n", "tt", ":term<CR>", { silent = true })
s("t", "<Esc>", "<C-\\><C-n>", { silent = true })

-- s("n", "<S-h>", "^", { silent = true })
-- s("n", "<S-l>", "$", { silent = true })
--
-- s("n", "<S-Right>", "<C-w><", { silent = true })
-- s("n", "<S-Left>", "<C-w>>", { silent = true })
-- s("n", "<S-Up>", "<C-w>+", { silent = true })
-- s("n", "<S-Down>", "<C-w>-", { silent = true })
--
-- s("v", "c", [["_c]], { silent = true })
-- s("v", "p", [[_dp]], { silent = true })
--
-- s("n", "<Esc><Esc>", "<cmd>noh<CR>", { silent = true })
--
-- s("n", "<C-s>", [[:%s/]], { silent = true })
--
-- s("n", "<leader>sp", "<cmd>PackerStatus<CR>")
-- s("n", "<leader>sl", "<cmd>LuaCacheProfile<CR>")
--
-- s("n", "<A-v>", "<C-w><C-v>")
-- s("n", "<A-s>", "<C-w><C-s>")
--
-- s("n", "<leader>q", "<cmd>q<CR>")
-- s("n", "<leader>w", "<cmd>w<CR>")
