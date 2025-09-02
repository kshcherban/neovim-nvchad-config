-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

-- M.ui = {
--   theme = "onenord",
-- }
--
-- M.plugins = "plugins"

-- M.mappings = require "mappings"

-- Custom statusline configuration
M.ui = {
  statusline = {
    theme = "default", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "default",
    order = nil,
    modules = nil,
  },
}

-- Override statusline modules
M.ui.statusline.modules = {
  -- Left side customization: show relative path instead of short filename
  file = function()
    local icon = " 󰈚 "
    local path = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())

    if path == "" then
      return "%#St_file_info#" .. icon .. "Empty " .. "%#St_file_sep#" .. "▊"
    end

    -- Get relative path from current working directory
    local cwd = vim.fn.getcwd()
    local name

    -- Check if file is within current working directory
    if path:sub(1, #cwd) == cwd then
      -- File is within cwd, show relative path
      name = path:sub(#cwd + 2) -- +2 to remove cwd and the slash
      if name == "" then
        name = vim.fn.fnamemodify(path, ":t")
      end
    else
      -- File is outside cwd, show just filename
      name = vim.fn.fnamemodify(path, ":t")
    end

    local devicons_present, devicons = pcall(require, "nvim-web-devicons")
    if devicons_present then
      local ft_icon = devicons.get_icon(vim.fn.fnamemodify(path, ":t"))
      icon = (ft_icon ~= nil and " " .. ft_icon) or icon
    end

    return "%#St_file_info#" .. icon .. " " .. name .. " " .. "%#St_file_sep#" .. "▊"
  end,

  -- Right side customization: show current line/total lines instead of line:column
  cursor = function()
    local icon = " "
    local current_line = vim.fn.line "."
    local total_lines = vim.fn.line "$"
    return "%#St_pos_sep#"
      .. "▊"
      .. "%#St_pos_icon#"
      .. icon
      .. "%#St_pos_text#"
      .. " "
      .. current_line
      .. "/"
      .. total_lines
      .. " "
  end,
}

return M
