--[[
  telescope.lua — Fuzzy finder (files, grep, buffers, help, etc.)
  Depends on plenary.nvim (pulled in automatically by Telescope).
]]

return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    -- No extra config required; keymaps are in config/keymaps.lua
  end,
}
