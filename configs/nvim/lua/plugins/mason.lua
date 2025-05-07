return {
  {
    'williamboman/mason.nvim',
    build = ':MasonUpdate',
    opts = {
      ui = {
        border = 'rounded',
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    },
  },

  -- Mason-lspconfig: bridges mason with lspconfig
  {
    'williamboman/mason-lspconfig.nvim',
    event = 'BufReadPre',
    dependencies = {
      'williamboman/mason.nvim',
      'neovim/nvim-lspconfig',
    },
    opts = {
      ensure_installed = {
        'lua_ls',
        'pyright',
        'ruff',
        'ts_ls',
        'rust_analyzer',
        'clangd',
        'bashls',
        'cssls',
        'html',
        'jsonls',
        'yamlls',
        'marksman',
      },
      automatic_installation = false,
    },
  },

  -- for non LSP mason packages
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      'neovim/nvim-lspconfig',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      require('mason-tool-installer').setup({
        ensure_installed = {
          'stylua',
          'prettierd',
        },
      })
    end,
  },
}
