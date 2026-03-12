--[[
  lsp.lua — LSP via Mason (install servers with :Mason or auto-install below)
  Python: pyright is ensured by mason-lspconfig; installs on first run.
]]

-- Load only when opening a file that uses LSP (avoids loading for .txt, .md, etc.)
return {
  "neovim/nvim-lspconfig",
  event = { "FileType python", "FileType lua" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- Defer so the buffer is drawn before LSP starts (feels faster when opening a file)
    vim.defer_fn(function()
      local lspconfig = require("lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- Mason: install LSP servers, formatters, etc. (UI: :Mason)
      require("mason").setup()

      -- Bridge Mason ↔ lspconfig; auto-install listed servers
      require("mason-lspconfig").setup({
        ensure_installed = { "pyright" },
        automatic_installation = true,
        handlers = {
          function(server_name)
            lspconfig[server_name].setup({ capabilities = capabilities })
          end,
        },
      })
    end, 0)
  end,
}
