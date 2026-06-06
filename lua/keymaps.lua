vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- Clear search highlight with Escape
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Buffer navigation
map("n", "[b", "<cmd>bprev<CR>", { desc = "Previous buffer" })
map("n", "]b", "<cmd>bnext<CR>", { desc = "Next buffer" })

-- Move lines up/down in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Keep cursor centered when jumping
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Toggle completion on/off
map("n", "<leader>tc", function()
  vim.g.cmp_enabled = vim.g.cmp_enabled == false
  vim.notify("Completion " .. (vim.g.cmp_enabled == false and "disabled" or "enabled"))
end, { desc = "Toggle completion" })

-- LSP keymaps are set in plugins/lsp.lua on LspAttach
