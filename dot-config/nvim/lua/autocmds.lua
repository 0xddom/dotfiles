local autocmd = vim.api.nvim_create_autocmd

autocmd("VimEnter", {
  command = ":silent !kitty @ set-spacing padding=0 margin=0",
})

autocmd("VimLeavePre", {
  command = ":silent !kitty @ set-spacing padding=20 margin=10",
})

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_config_" .. name, { clear = true })
end

autocmd("FileType", {
  group = augroup("commentstring"),
  pattern = { "cpp", "c" },
  callback = function()
    vim.opt.commentstring = "// %s"
  end,
  desc = "Change commentstring for C/C++ files"
})
