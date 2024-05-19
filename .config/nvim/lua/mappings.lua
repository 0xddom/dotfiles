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
end, { desc = "LSP Apply fix" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
