-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "catppuccin", -- default theme
  transparency = true,
  -- hl_override = {
  --   Comment = { italic = true, fg = "#a6adc8" },
  --   ["@comment"] = { italic = true, fg = "#a6adc8" },
  --   NonText = {
  --     fg = "#a6adc8",
  --     bg = "#1e1e2e",
  --   },
  --   LineNr = {
  --     fg = "#a6adc8",
  --     bg = "#1e1e2e",
  --   },
  --   TbTabOff = {
  --     fg = "#a6adc8",
  --     bg = "#1e1e2e",
  --   }
  -- },
}

M.mason = {
  pkgs = require "configs.mason"
}

return M
