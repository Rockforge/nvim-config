# Neovim config

Lua-based Neovim configuration using [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager.

## Requirements

- [Neovim](https://neovim.io/) (0.9+)
- Git (for bootstrapping lazy.nvim)

## Structure

```
~/.config/nvim/
├── init.lua              # Entry point: loads options → keymaps → lazy.nvim
├── lua/
│   ├── config/
│   │   ├── options.lua    # Display, indent, search, clipboard, splits, etc.
│   │   ├── keymaps.lua    # Leader key and all keybindings
│   │   └── lazy.lua       # Lazy.nvim bootstrap and plugin spec imports
│   └── plugins/
│       ├── init.lua       # Base plugin list (can be empty)
│       └── telescope.lua  # Telescope + plenary
└── lazy-lock.json        # Lockfile for plugin versions
```

On first run, lazy.nvim is cloned into `stdpath("data")/lazy/lazy.nvim` and plugins are installed from the specs in `lua/plugins/`.

## Leader key

Leader is `,` (comma).

## Keybindings

| Key | Description |
|-----|-------------|
| `,w` | Save buffer |
| `,q` | Quit window |
| `Esc` | Clear search highlight |
| `Ctrl+h/j/k/l` | Move focus to left / down / up / right window |
| `,v` | Vertical split |
| `,s` | Horizontal split |
| `,ff` | Telescope: find files |
| `,fg` | Telescope: live grep |
| `,fb` | Telescope: buffers |
| `,fh` | Telescope: help tags |
| `;` | Enter command line (same as `:`) |
| `fd` (insert) | Exit insert mode |

## Adding plugins

1. Add a new file under `lua/plugins/` (e.g. `lua/plugins/which-key.lua`) that returns a Lazy spec table, or add specs to `lua/plugins/init.lua`.
2. In `lua/config/lazy.lua`, add an import in the `spec` table, e.g. `{ import = "plugins.which-key" }`.
3. Restart Neovim; lazy.nvim will install the plugin on next start.

## Options summary

- Line numbers: absolute + relative, cursor line highlight
- Indent: 4 spaces, expandtab, smartindent
- Search: ignorecase, smartcase, no hlsearch, incsearch
- No swap/backup; undofile enabled
- System clipboard (`unnamedplus`), splits open right/below
- UTF-8 encoding, mouse enabled
