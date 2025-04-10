local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = { "html", "cssls", "gopls", "marksman", "terraformls", "rust_analyzer" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Configure Pyright for diagnostics
lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    pyright = {
      -- Disable Pyright's import organizer since Ruff will handle this
      disableOrganizeImports = true,
    },
  },
}

-- Configure Ruff for formatting only
lspconfig.ruff.setup {
  on_attach = function(client, bufnr)
    -- Call the default on_attach function
    on_attach(client, bufnr)

    -- Disable Ruff diagnostics, we'll use Pyright for this
    client.server_capabilities.diagnosticProvider = false

    -- Keep Ruff's formatting capability
    client.server_capabilities.documentFormattingProvider = true
  end,
  capabilities = capabilities,
}
