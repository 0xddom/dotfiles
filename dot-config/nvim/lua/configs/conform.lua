local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    cpp = { "clang-format" },
    python = { "isort", "black" },
    latex = { "latexindent" },
    bibtex = { "bibtex-tidy" },
    ruby = { "rubocop" },
    cmake = { "cmake_format" },
    tablegen = { "clang-format" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 1500,
    lsp_fallback = true,
  },
}

return options
