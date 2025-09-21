require("nvchad.configs.lspconfig").defaults()

local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
-- local lspconfig = require "lspconfig"
-- local util = require "lspconfig/util"

local function default_on_attach(client, bufnr)
  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(true)
  end
  on_attach(client, bufnr)
end

local servers = {
  clangd = {
    on_attach = function(client, bufnr)
      -- client.server_capabilities.signatureHelpProvider = false
      default_on_attach(client, bufnr)
    end,
  },
  rust_analyzer = {
    filetypes = { "rust" },
    -- root_dir = util.root_pattern "Cargo.toml",
    root_dir = vim.lsp.util.root_pattern "Cargo.toml",
    settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
        },
      },
    },
  },
  ts_ls = {
    init_options = {
      preferences = {
        disableSuggestions = true,
        importModuleSpecifierEnding = "index",
      },
    },
  },
  texlab = {},
  pyright = {
    filetypes = { "python" },
  },
  cmake = {},
  tblgen_lsp_server = {},
}

for name, opts in pairs(servers) do
  if opts.on_init ~= nil then
    opts.on_init = on_init
  end
  if opts.on_attach ~= nil then
    opts.on_attach = default_on_attach
  end
  if opts.capabilities ~= nil then
    opts.capabilities = capabilities
  end

  -- lspconfig[name].setup(opts)
  vim.lsp.config[name].setup(opts)
end
