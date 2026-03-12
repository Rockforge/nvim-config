--[[
  options.lua — Neovim option settings (vim.opt)
  Groups: display, indent/tabs, search, timing/files, clipboard, splits, encoding, mouse
]]

local opt = vim.opt

-- -----------------------------------------------------------------------------
-- Display & UI
-- -----------------------------------------------------------------------------
opt.number = true           -- Show absolute line numbers in the gutter
opt.relativenumber = true   -- Show line numbers relative to cursor for easier j/k movement
opt.cursorline = true       -- Highlight the line the cursor is on
opt.wrap = false            -- Do not wrap long lines; use horizontal scroll
opt.signcolumn = "yes"      -- Always show sign column (for LSP, git, etc.)
opt.termguicolors = true    -- Use 24-bit RGB color in the terminal
opt.scrolloff = 8           -- Minimum number of screen lines to keep above/below cursor
opt.sidescrolloff = 8       -- Minimum columns to keep left/right of cursor when scrolling horizontally

-- -----------------------------------------------------------------------------
-- Indentation & Tabs
-- -----------------------------------------------------------------------------
opt.tabstop = 4             -- Number of spaces a <Tab> in the file counts for
opt.shiftwidth = 4          -- Number of spaces to use for (auto)indent
opt.expandtab = true        -- Insert spaces when pressing <Tab>
opt.smartindent = true      -- Do smart indenting when starting a new line
opt.autoindent = true       -- Copy indent from current line when starting a new line

-- -----------------------------------------------------------------------------
-- Search
-- -----------------------------------------------------------------------------
opt.ignorecase = true       -- Ignore case in search patterns
opt.smartcase = true        -- Override ignorecase when pattern has uppercase
opt.hlsearch = false        -- Do not highlight all matches of the last search
opt.incsearch = true        -- Show match for the pattern while typing

-- -----------------------------------------------------------------------------
-- Timing, swap/backup, undo
-- -----------------------------------------------------------------------------
opt.updatetime = 250        -- Write swap file and trigger CursorHold after this many ms
opt.timeoutlen = 400        -- Time in ms to wait for a key code or mapping to complete
opt.swapfile = false        -- Do not create a swap file for the buffer
opt.backup = false          -- Do not keep a backup file after overwriting
opt.undofile = true         -- Persist undo history to a file (survives restarts)

-- -----------------------------------------------------------------------------
-- Clipboard & splits
-- -----------------------------------------------------------------------------
opt.clipboard = "unnamedplus" -- Use system clipboard for yank/paste (Linux: primary + clipboard)
opt.splitright = true       -- New vertical split opens to the right of the current window
opt.splitbelow = true       -- New horizontal split opens below the current window

-- -----------------------------------------------------------------------------
-- Encoding & input
-- -----------------------------------------------------------------------------
opt.fileencoding = "utf-8"  -- Character encoding for the current file
opt.encoding = "utf-8"      -- Character encoding used in the UI
opt.mouse = "a"             -- Enable mouse in all modes (normal, visual, insert, etc.)
