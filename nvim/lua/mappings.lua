require "nvchad.mappings"
local M = {}

M.custom = {
  n = {
    ["<C-d>"] = { "<C-d>zz", "jump half screen down" },
    ["<C-u>"] = { "<C-u>zz", "jump half screen up" },
    ["n"] = { "nzz", "jump to next occurence" },
    ["N"] = { "Nzz", "jump to previous occurence" },
  },
}

M.nvimtree = {
  n = {
    ["<leader>t"] = { vim.cmd.NvimTreeToggle, "toggle NvimTree" },
  },
}

return M
