local M = {}

M["max397574/better-escape.nvim"] = {
  event = "InsertEnter",
  config = function()
    require("better_escape").setup()
  end,
}

M["tpope/vim-surround"] = {}

M["neovim/nvim-lspconfig"] = {
  config = function()
    local on_attach = require("plugins.configs.lspconfig").on_attach
    local capabilities = require("plugins.configs.lspconfig").capabilities

    local lspconfig = require "lspconfig"

    local servers = {
      "html",
      "cssls",
      "svelte",
      "tsserver",
      "emmet_ls",
      "gopls",
      "marksman",
      "rust_analyzer",
      "terraformls",
      "pylsp",
    }

    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }
    end
  end,
}

M["jose-elias-alvarez/null-ls.nvim"] = {
  after = "nvim-lspconfig",

  config = function()
    local present, null_ls = pcall(require, "null-ls")
    if not present then
      return
    end

    local b = null_ls.builtins

    local sources = {
      -- webdev stuff
      b.formatting.prettier.with {
        extra_filetypes = { "svelte", "md", "json" },
      },

      b.formatting.gofumpt.with {
        filetype = "go"
      },

      b.formatting.goimports,

      b.formatting.stylua,
      b.formatting.rustfmt.with {
        filetype = "rust",
      },
    }

    null_ls.setup {
      debug = true,
      sources = sources,
    }
  end,
}

M["folke/which-key.nvim"] = {
  disable = false,
}

M["ggandor/leap.nvim"] = {
  config = function()
    local leap = require "leap"
    leap.add_default_mappings()
  end,
}

M["terrastruct/d2-vim"] = {}

M["mbbill/undotree"] = {}

M["averms/black-nvim"] = {}

M["tpope/vim-fugitive"] = {}

M["sindrets/diffview.nvim"] = {}

return M
