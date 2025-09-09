local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    groovy = { "npm-groovy-lint" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 3000,
    lsp_fallback = true,
  },

  formatters = {
    ["npm-groovy-lint"] = {
      prepend_args = { "--javaexecutable", "/opt/homebrew/opt/openjdk@17/bin/java" },
    },
  },
}

return options
