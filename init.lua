--[[
  init.lua — Neovim entry point
  Loads config modules in order: options, keymaps, then the lazy.nvim plugin manager.
]]

-- Load option settings (display, indent, search, clipboard, etc.)
require("config.options")

-- Load key mappings (leader, save/quit, window nav, splits, etc.)
require("config.keymaps")

-- Bootstrap and run lazy.nvim (loads plugins from lua/plugins/)
require("config.lazy")
