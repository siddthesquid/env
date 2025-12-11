local Keymap = require('siddthesquid.keymap')

return {
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'j-hui/fidget.nvim', opts = {} },
    config = function()
      local lspconfig = require('lspconfig')
      local util = require('lspconfig.util')

      local original_capabilities = vim.lsp.protocol.make_client_capabilities()
      local capabilities =
        require('blink.cmp').get_lsp_capabilities(original_capabilities)

      vim.lsp.config('*', {
        capabilities = capabilities,
      })

      -- Keybindings
      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = Keymap.lsp_attach(),
      })

      -- Lua
      lspconfig.lua_ls.setup({})

      -- Typescript (with vtsls)
      lspconfig.vtsls.setup({})

      -- JSON
      -- lspconfig.jsonls.setup({
      --   settings = {
      --     -- json = {
      --     keepLines = true,
      --     format = {
      --       enable = false,
      --       keepLines = true,
      --     },
      --     -- },
      --     validate = { enable = true },
      --   },
      -- })

      -- vim.lsp.enable('jsonls')
      -- vim.lsp.config('jsonls', {
      --   settings = {
      --     json = {
      --       format = {
      --         enable = true,
      --       },
      --     },
      --   },
      -- })
      --
      -- Typescript (with ts_ls)
      -- lspconfig.ts_ls.setup({
      --   root_dir = require('lspconfig.util').root_pattern(
      --     'pnpm-workspace.yaml',
      --     'pnpm-lock.yaml',
      --     '.git'
      --   ),
      --   init_options = {
      --     preferences = {
      --       includeCompletionsForModuleExports = true,
      --       includeCompletionsForImportStatements = true,
      --       includeCompletionsWithInsertText = true,
      --       importModuleSpecifierPreference = 'project-relative',
      --     },
      --   },
      -- })

      -- Tailwind
      lspconfig.tailwindcss.setup({})

      -- lspconfig.basedpyright.setup({})
      lspconfig.basedpyright.setup({
        -- Standard root directory detection for uv/python projects
        -- root_dir = util.root_pattern('pyproject.toml', '.git'),
        root_dir = util.root_pattern('uv.lock'),

        -- dynamic configuration hook
        on_new_config = function(new_config, new_root_dir)
          -- Construct path to the local executable
          local python_bin = new_root_dir
            .. '/.venv/bin/basedpyright-langserver'

          -- If the local binary exists, use it
          if vim.uv.fs_stat(python_bin) then
            new_config.cmd = { python_bin, '--stdio' }
          end
        end,

        -- Your other settings (capabilities, on_attach, etc.)
      })
    end,
  },
}
