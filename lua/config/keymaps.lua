--[[
  keymaps.lua — Neovim key mappings (vim.keymap.set)
  Leader is "," (set in options/init). Modes: n = normal, i = insert
]]

-- -----------------------------------------------------------------------------
-- Leader key (must be set before mappings that use <leader>)
-- -----------------------------------------------------------------------------
vim.g.mapleader = ","       -- Leader key for custom keybindings (e.g. <leader>w)

-- -----------------------------------------------------------------------------
-- File operations (normal mode)
-- -----------------------------------------------------------------------------
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save buffer" })   -- Save current file
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit window" })   -- Quit current window

-- -----------------------------------------------------------------------------
-- Search
-- -----------------------------------------------------------------------------
vim.keymap.set("n", "<Esc>", ":noh<CR>", { desc = "Clear search highlight" }) -- Clear search highlight on Esc

-- -----------------------------------------------------------------------------
-- Window navigation (normal mode)
-- -----------------------------------------------------------------------------
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })   -- Move focus to window left
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })  -- Move focus to window right
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" }) -- Move focus to window below
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" }) -- Move focus to window above

-- -----------------------------------------------------------------------------
-- Split creation
-- -----------------------------------------------------------------------------
vim.keymap.set("n", "<leader>v", ":vsplit<CR>", { desc = "Vertical split" })   -- Open a new vertical split
vim.keymap.set("n", "<leader>s", ":split<CR>", { desc = "Horizontal split" }) -- Open a new horizontal split

-- -----------------------------------------------------------------------------
-- Command line & insert conveniences
-- -----------------------------------------------------------------------------
vim.keymap.set("n", ";", ":", { noremap = true, desc = "Enter command line" }) -- Use ; to enter command line (like :)
vim.keymap.set("i", "fd", "<Esc>", { noremap = true, desc = "Exit insert mode" }) -- Type "fd" in insert to return to normal
