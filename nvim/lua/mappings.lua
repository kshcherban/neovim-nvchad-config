require "nvchad.mappings"

local map = vim.keymap.set

map("n", "<leader>t", "<cmd> NvimTreeToggle <cr>", { desc = "toggle NvimTree" })
map("n", "<C-d>", "<C-d>zz", { desc = "jump half screen down" })
map("n", "<C-u>", "<C-u>zz", { desc = "jump half screen up" })
-- map("n", "n", "nzz", { desc = "jump to next occurence" })
-- map("n", "N", "Nzz", { desc = "jump to previous occurence" })
-- Exit terminal mode with <Esc>
map("t", "<Esc>", vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, true, true))
-- repeat last command with dot
map("n", ",", "@:")
