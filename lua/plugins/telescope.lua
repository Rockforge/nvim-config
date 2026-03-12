--[[
  telescope.lua — Fuzzy finder (files, grep, buffers, help, etc.)
  Depends on plenary.nvim (pulled in automatically by Telescope).
]]

-- Load only when needed (e.g. first time you run :Telescope or use a Telescope keymap)
return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  cmd = "Telescope",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    -- No extra config required; keymaps are in config/keymaps.lua
  end,
}
