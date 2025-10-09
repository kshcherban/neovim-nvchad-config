local overrides = require "configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options
  -- Install mason and dependencies
  -- Override to setup mason-lspconfig-
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "nvchad.configs.lspconfig"
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  {
    "tpope/vim-fugitive",
  },
  {
    "sindrets/diffview.nvim",
    lazy = false,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- LSP fancy diagnostics
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
    },
  },

  -- Terraform highlighting
  -- {
  --   "nathom/filetype.nvim",
  --   lazy = false,
  --    config = function()
  --      require("filetype").setup {
  --        overrides = {
  --          extensions = {
  --            tf = "terraform",
  --            tfvars = "terraform",
  --            tfstate = "json",
  --            sh = "sh",
  --            sql = "sql",
  --          },
  --           complex = {
  --             ['.*/.bash.*'] = "sh"
  --           },
  --        },
  --      }
  --    end,
  --  },

  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    opts = overrides.copilot,
  },
  -- {
  --   "github/copilot.vim",
  --   lazy = false,
  -- },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    opts = overrides.cmp,
  },

  -- Show git blame info on line hover
  {
    "f-person/git-blame.nvim",
    -- load the plugin at startup
    event = "VeryLazy",
  },

  -- Github copilot replacement
  -- {
  --   "milanglacier/minuet-ai.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --   },
  --   event = "BufReadPre",
  --   config = function()
  --     require("minuet").setup {
  --       virtualtext = {
  --         keymap = {
  --           accept_line = "<M-l>",
  --           accept = "<M-z>",
  --         },
  --         auto_trigger_ft = {
  --           "tf",
  --           "terraform",
  --           "python",
  --           "groovy",
  --           "java",
  --           "shell",
  --           "sh",
  --           "ts",
  --           "js",
  --           "jenkinsfile",
  --           "golang",
  --           "go",
  --         },
  --       },
  --       provider = "gemini",
  --       provider_options = {
  --         gemini = {
  --           model = "gemini-2.5-flash",
  --           stream = true,
  --           optional = {
  --             generationConfig = {
  --               maxOutputTokens = 256,
  --               thinkingConfig = { thinkingBudget = 0 },
  --             },
  --           },
  --         },
  --         claude = {
  --           model = "claude-sonnet-4-5-20250929",
  --           stream = true,
  --           end_point = "https://delorean.auto1.team/proxy-api/anthropic",
  --         },
  --       },
  --     }
  --   end,
  -- },
}

return plugins
