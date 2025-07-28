local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "markdown",
    "markdown_inline",
    "python",
    "go",
    "bash",
    "hcl",
    "terraform",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "terraform-ls",
    "ruff",
    "pyright",
    "gopls",
    "marksman",
    "shellcheck",
    "rust-analyzer",
    "bash-language-server",
    -- for jenkins
    "npm-groovy-lint", -- format groovy files
    "groovy-language-server",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },

  view = {
    adaptive_size = true,
  },
  -- don't ask for window when opening files
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
}

M.copilot = {
  -- Possible configurable fields can be found on:
  -- https://github.com/zbirenbaum/copilot.lua#setup-and-configuration
  suggestion = {
    auto_trigger = true,
  },
  filetypes = {
    yaml = true,
  },
}

local cmp = require "cmp"

M.cmp = {
  completion = {
    completeopt = "menu,menuone,noinsert,noselect",
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ["<CR>"] = cmp.mapping.confirm { select = false },
  },
}

return M
