local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- python
  b.formatting.ruff,
  b.formatting.black,

  -- rust
  b.formatting.rustfmt,

  -- terraform
  b.formatting.terraform_fmt,
}

null_ls.setup {
  debug = true,
  sources = sources,
}

