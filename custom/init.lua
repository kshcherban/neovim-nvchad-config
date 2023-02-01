-- example file i.e lua/custom/init.lua
-- load your options globals, autocmds here or anything .__.
-- you can even override default options here (core/options.lua)

vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.showtabline = 2
vim.opt.incsearch = false
-- autoformat on save
vim.g.terraform_fmt_on_save = 1
vim.g.rustfmt_autosave = 1
vim.g.go_fmt_autosave = 1
-- disable mouse in insert mode
vim.opt.mouse = 'nv'
--- display bogus symbols
vim.opt.list = true
vim.opt.listchars:append({tab = '→·', trail = '·', nbsp = '¬'})
