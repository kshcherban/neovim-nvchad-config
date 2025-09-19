local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

-- Configure basic servers using new vim.lsp.config syntax
local servers = { "html", "cssls", "gopls", "marksman", "terraformls", "rust_analyzer" }

for _, server in ipairs(servers) do
  vim.lsp.config(server, {
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

-- Configure Pyright for diagnostics
vim.lsp.config("pyright", {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    pyright = {
      -- Disable Pyright's import organizer since Ruff will handle this
      disableOrganizeImports = true,
    },
  },
})

-- Configure Ruff for formatting only
vim.lsp.config("ruff", {
  on_attach = function(client, bufnr)
    -- Call the default on_attach function
    on_attach(client, bufnr)

    -- Disable Ruff diagnostics, we'll use Pyright for this
    client.server_capabilities.diagnosticProvider = false

    -- Keep Ruff's formatting capability
    client.server_capabilities.documentFormattingProvider = true
  end,
  capabilities = capabilities,
})

-- vim.lsp.config('groovyls', {
--   cmd = {
--     "/opt/homebrew/opt/openjdk@21/bin/java",
--     "-jar",
--     vim.fn.expand "$HOME/.local/share/nvim/mason/packages/groovy-language-server/build/libs/groovy-language-server-all.jar",
--   },
--   filetypes = { "groovy", "Jenkinsfile" },
--   on_attach = on_attach,
--   capabilities = capabilities,
--   settings = {
--     groovy = {
--       classpath = {
--         "/Users/kshcherban/.jenkins/plugins/ace-editor/WEB-INF/lib/ace-editor.jar",
--         "/Users/kshcherban/.jenkins/war/WEB-INF/lib/xpp3-1.1.4c.jar",
--         "/Users/kshcherban/.jenkins/war/WEB-INF/lib/xstream-1.4.20.jar",
--         -- Your Jenkins library source directories
--         "/Users/kshcherban/repos/wkda/jenkins-libraries-devops/vars/",
--         "/Users/kshcherban/repos/wkda/jenkins-libraries-centralize-deployments/vars/",
--         "/Users/kshcherban/repos/wkda/jenkins-libraries-centralize-deployments/src/",
--         "/Users/kshcherban/repos/wkda/jenkins-libraries-centralize-deployments/build/libs/jenkins-libraries-centralize-deployments-1.0-SNAPSHOT.jar",
--       },
--     },
--   },
--   -- root_dir = lspconfig.util.root_pattern("Jenkinsfile", ".git", "vars/", "src/"),
-- })
-- vim.lsp.enable('groovyls')

-- Enable all configured LSP servers
for _, server in ipairs(servers) do
  vim.lsp.enable(server)
end
vim.lsp.enable "pyright"
vim.lsp.enable "ruff"
