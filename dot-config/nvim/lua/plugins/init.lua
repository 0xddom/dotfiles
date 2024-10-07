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
      },
    },
  },
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
        "lua-language-server",
        "pyright",
        "black",
        "isort",
        "latexindent",
        "gh",
        "bibtex-tidy",
        "tree-sitter-cli",
        "rubocop",
      },
    },
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  "nvim-neotest/nvim-nio",
  {
    "tpope/vim-surround",
    lazy = false,
  },
}
