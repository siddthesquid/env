local Keymap = require("siddthesquid.keymap")

return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = {
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },

  -- Mason-lspconfig: bridges mason with lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    event = "BufReadPre",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = {
        "pyright",
        "lua_ls",
        "ts_ls",
        "rust_analyzer",
        "clangd",
        "bashls",
        "cssls",
        "html",
        "jsonls",
        "yamlls",
        "marksman",
        "ruff"
      },
      automatic_installation = false
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "j-hui/fidget.nvim", opts = {} },
    config = function()
      local lspconfig = require('lspconfig')

      local original_capabilities = vim.lsp.protocol.make_client_capabilities()
      local capabilities = require("blink.cmp").get_lsp_capabilities(original_capabilities)

      vim.lsp.config('*', {
        capabilities = capabilities
      })

      -- Keybindings
      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = Keymap.tree
      })

      lspconfig.lua_ls.setup({})

    end
  }
}
