local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    cpp = { "clang-format" },
    python = { "isort", "black" },
    latex = { "latexindent" },
    bibtex = { "bibtex-tidy" },
    ruby = { "rubocop" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 1500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
