require "nvchad.mappings"

local map = vim.keymap.set

map("n", "<leader>t", "<cmd> NvimTreeToggle <cr>", { desc = "toggle NvimTree" })
map("n", "<C-d>", "<C-d>zz", { desc = "jump half screen down" })
map("n", "<C-u>", "<C-u>zz", { desc = "jump half screen up" })
-- map("n", "n", "nzz", { desc = "jump to next occurence" })
-- map("n", "N", "Nzz", { desc = "jump to previous occurence" })
-- Exit terminal mode with <Esc>
map("t", "<Esc>", vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, true, true))
-- Go to the first terminal buffer
map("n", "<leader>T", function()
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    local name = vim.api.nvim_buf_get_name(bufnr)
    if name:match "^term://" then
      vim.cmd("buffer " .. bufnr)
      return
    end
  end
  vim.notify("No terminal buffer found", vim.log.levels.WARN)
end
-- repeat last command with dot
map("n", ",", "@:")
