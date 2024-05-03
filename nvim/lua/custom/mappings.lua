local M = {}
M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Start or continue the debugger",
    }
  }
}

M.crates = {
  n = {
    ["<leader>rcu"] = {
      function ()
        require('crates').upgrade_all_crates()
      end,
      "Update all crates"
    }
  }
}

M['nvim-lspconfig'] = {
  n = {
    ["<leader>fa"] = {
      function ()
        vim.lsp.buf.code_action()
      end,
      "LSP Apply fix"
    }
  }
}
return M
