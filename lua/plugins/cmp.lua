--[[
  cmp.lua — Autocomplete via nvim-cmp
  Sources: buffer words, file paths. Add cmp-nvim-lsp and lspconfig for LSP completion.
]]

-- Load when you first enter insert mode (keeps file open fast)
return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- LSP completion (Python, etc.)
    "hrsh7th/cmp-buffer",   -- words from open buffers
    "hrsh7th/cmp-path",     -- file paths
    "hrsh7th/cmp-cmdline",  -- cmdline completion (e.g. :)
    "L3MON4D3/LuaSnip",     -- snippet engine
    "saadparwaiz1/cmp_luasnip", -- snippets as completion source
    "rafamadriz/friendly-snippets", -- snippet collections
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    -- Load friendly-snippets (optional; remove if you don't want snippet suggestions)
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources(
        { { name = "nvim_lsp" } }, -- LSP (Python, etc.) first
        { { name = "luasnip" } },
        { { name = "buffer" } },
        { { name = "path" } }
      ),
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
    })

    -- Optional: completion in the command line (:, /, ?)
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = { { name = "buffer" } },
    })
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
    })
  end,
}
