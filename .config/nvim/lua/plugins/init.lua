return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "iden3/vim-circom-syntax",
    ft = "circom",
  },
  -- {
  --    "rcarriga/nvim-dap-ui",
  --    event = "VeryLazy",
  --    dependencies = "mfussenegger/nvim-dap",
  --    config = function()
  --      local dap = require("dap")
  --      local dapui = require("dapui")
  --      dapui.setup()
  --      dap.listeners.after.event_initialized["dapui_config"] = function ()
  --        dapui.open()
  --      end
  --      dap.listeners.before.event_terminated["dapui_config"] = function ()
  --        dapui.close()
  --      end
  --      dap.listeners.before.event_exited["dapui_config"] = function ()
  --        dapui.close()
  --      end
  --    end
  --  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "cpp",
        "nix",
        "rust",
        "typescript",
      },
    },
  },
  --  {
  --    "jay-babu/mason-nvim-dap.nvim",
  --    event = "VeryLazy",
  --    dependencies = {
  --      "williamboman/mason.nvim",
  --      "mfussenegger/nvim-dap",
  --    },
  --    opts = {
  --      handlers = {},
  --    },
  --  },
  --  {
  --    "mfussenegger/nvim-dap",
  --    config = function (_, _)
  --      require("core.utils").load_mappings("dap")
  --    end
  --  },
  -- {
  --   "nvimtools/none-ls.nvim",
  --   event = "VeryLazy",
  --   opts = function()
  --     return require "custom.configs.null-ls"
  --   end
  -- },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "clang-format",
        "codelldb",
        "rust-analyzer",
        "typescript-language-server",
        "eslint-lsp",
        "texlab",
      },
    },
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "Saecki/crates.nvim",
    dependencies = "hrsh7th/nvim-cmp",
    ft = { "rust", "toml" },
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
      crates.show()
    end,
  },
  --  {
  --    "hrsh7th/nvim-cmp",
  --    opts = function ()
  --      local M = require "plugins.configs.cmp"
  --      table.insert(M.sources, {name = "crates"})
  --      return M
  --    end
  --  }
}
