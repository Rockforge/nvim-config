--[[
  lazy.lua — Lazy.nvim plugin manager bootstrap and setup
  Clones lazy.nvim on first run, then loads plugins from lua/plugins/
]]

-- Path where lazy.nvim will be installed (under stdpath("data"))
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Bootstrap: clone lazy.nvim if not already present
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit...", "Normal" },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

-- Prepend lazy.nvim to runtimepath so `require("lazy")` works
vim.opt.rtp:prepend(lazypath)

-- Start lazy.nvim: load plugin specs from lua/plugins/ (e.g. lua/plugins/init.lua, plugins/telescope.lua)
require("lazy").setup({
  spec = {
    { import = "plugins" },
    { import = "plugins.telescope" },
    { import = "plugins.cmp" },
    { import = "plugins.lsp" },
    { import = "plugins.which-key" },
    { import = "plugins.lualine" },
  },
  install = { colorscheme = {} },
  checker = { enabled = false },
})
