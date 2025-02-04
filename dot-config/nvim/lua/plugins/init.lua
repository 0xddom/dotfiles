return {
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
        "python",
        "latex",
        "bibtex",
        "ruby",
        "solidity",
        "tablegen",
        "mlir",
        "cmake",
        "ledger",
        "llvm",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  -- {
  --   "williamboman/mason.nvim",
  --   config = function()
  --     require "configs.mason"
  --   end,
  --
  -- },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  "nvim-neotest/nvim-nio",
  {
    "tpope/vim-surround",
    lazy = false,
  },
  {
    "direnv/direnv.vim",
    lazy = false,
  },
  {
    -- TODO: Check if I want to remove this one
    "stevearc/overseer.nvim",
    opts = {},
    config = function()
      require("overseer").setup()
    end,
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
}
