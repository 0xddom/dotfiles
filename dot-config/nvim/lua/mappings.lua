require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- dap mappings
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line " })
map("n", "<leader>dr", "<cmd> DapContinue <CR>", { desc = "Start or continue the debugger " })

-- crates
map("n", "<leader>rcu", function()
  require("crates").upgrade_all_crates()
end, { desc = "Update all crates" })

-- LSP
map("n", "<leader>fa", function()
  vim.lsp.buf.code_action()
end, { desc = "[LSP] Apply fix" })
map("n", "gD", function()
  vim.lsp.buf.declaration()
end, { desc = "[LSP] Go to declaration" })
map("n", "gi", function()
  vim.lsp.buf.implementation()
end, { desc = "[LSP] Go to implementation" })
map("n", "gt", function()
  vim.lsp.buf.type_definition()
end, { desc = "[LSP] Go to type definition" })

-- Tmux navigation
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "Window left" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "Window right" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "Window down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "Window up" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>cg", "<cmd> CMakeGenerate<CR>", { desc = "Generate CMake project" })
map("n", "<leader>cb", "<cmd> CMakeBuild<CR>", { desc = "Build CMake project" })
map("n", "<leader>cq", "<cmd> CMakeClose<CR>", { desc = "Close CMake" })
map("n", "<leader>cc", "<cmd> CMakeClean<CR>", { desc = "Clean CMake outputs" })


-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
