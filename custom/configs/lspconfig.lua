local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "gopls", "marksman", "pyright", "terraformls", "rust_analyzer", "bashls", }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- 
-- lspconfig.pyright.setup { blabla}
