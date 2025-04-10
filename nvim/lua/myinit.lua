-- example file i.e lua/custom/init.lua
-- load your options globals, autocmds here or anything .__.
-- you can even override default options here (core/options.lua)

vim.opt.relativenumber = true
vim.opt.linebreak = true
vim.opt.showtabline = 2
vim.opt.incsearch = false
vim.g.terraform_fmt_on_save = 1
-- disable mouse in insert mode
vim.opt.mouse = 'nv'
--- display bogus symbols
vim.opt.list = true
vim.opt.listchars:append({tab = '→·', trail = '·', nbsp = '¬'})
--- set python
-- vim.g.loaded_python3_provider = nil
-- vim.cmd("runtime python3_provider")
-- vim.g.python3_host_prog = '~/.local/venv/nvim/bin/python'
--- format all files
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
--- run black on save
-- vim.cmd [[autocmd BufWritePre *.py call Black()]]

-- copy full path to buffer
vim.api.nvim_create_user_command("CopyFullPath", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})
-- copy rel path to buffer
vim.api.nvim_create_user_command("CopyRelPath", function()
  local path = vim.fn.expand("%")
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

-- proper syntax highlighting for terraform
vim.filetype.add({
  extension = {
    tf = "terraform",
    tfvars = "terraform-vars"
  }
})

-- vim.g.luasnippets_path = ""

-- set custom comment string to work around broken Jenkinsfile support
vim.bo.commentstring = '//%s'

vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)

vim.api.nvim_create_user_command("ToogleAutopairs", function()
    local autopairs = require'nvim-autopairs'

    if autopairs.state.disable then
        autopairs.enable()
    else
        autopairs.disable()
    end
end, {})

-- Configure diagnostic display on hover
vim.diagnostic.config({
  virtual_text = false,    -- Show diagnostic messages as virtual text
  signs = true,           -- Show diagnostic signs in the sign column
  underline = true,       -- Underline text with diagnostics
  update_in_insert = false, -- Don't update diagnostics in insert mode
  severity_sort = true,   -- Sort diagnostics by severity
  float = {
    focusable = false,    -- Make the hover window non-focusable
    style = "minimal",    -- Minimal style for the hover window
    border = "rounded",   -- Add a rounded border
    source = "always",    -- Always show the source of the diagnostic
    header = "",          -- No header
    prefix = "",          -- No prefix
  },
})

-- Set up hover handler
vim.o.updatetime = 250  -- Reduce updatetime for a more responsive experience
vim.api.nvim_create_autocmd("CursorHold", {
  buffer = bufnr,
  callback = function()
    vim.diagnostic.open_float(nil, {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = "rounded",
      source = "always",
      prefix = "",
      scope = "cursor",
    })
  end,
})
