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
        "lua_ls"
      },
      automatic_installation = false
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')

      -- Keybindings

      -- Lua
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT',
            },
            diagnostics = {
              globals = {'vim'},

              -- the b
              missingRequire = true,
              severity = {
                missingRequire = "Error",
              },
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = {
                vim.api.nvim_get_runtime_file("", true),
                -- Add your config directory to workspace
                vim.fn.expand('~/.config/nvim/lua'),
              },
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })
    end
  }
}
