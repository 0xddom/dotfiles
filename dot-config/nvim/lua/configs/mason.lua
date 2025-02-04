local ensure_installed = {
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
  -- "direnv",
  "cmakelang",
  "cmake-language-server",
  -- "tblgen-lsp-server",
}

return ensure_installed

-- require("mason").setup()
--
-- local mason_registry = require "mason-registry"
--
-- for _, pkg in ipairs(ensure_installed) do
--   if not mason_registry.is_installed(pkg) then
--     mason_registry.get_package(pkg):install()
--   end
-- end
