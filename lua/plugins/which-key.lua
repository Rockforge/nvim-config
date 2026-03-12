--[[
  which-key.lua — Show keybinding popup when pressing a prefix (e.g. <leader>).
  Uses desc from keymaps (config/keymaps.lua) automatically.
]]

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    require("which-key").setup({})
  end,
}
