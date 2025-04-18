local Keymap = require('siddthesquid.keymap')

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

  -- This is where we initialize everything
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'j-hui/fidget.nvim', opts = {} },
    config = function()
      local lspconfig = require('lspconfig')

      local original_capabilities = vim.lsp.protocol.make_client_capabilities()
      local capabilities =
        require('blink.cmp').get_lsp_capabilities(original_capabilities)

      vim.lsp.config('*', {
        capabilities = capabilities,
      })

      -- Keybindings
      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(
              mode,
              keys,
              func,
              { buffer = event.buf, desc = 'LSP: ' .. desc }
            )
          end

          -- Jump to the definition of the word under your cursor.
          --  This is where a variable was first declared, or where a function is defined, etc.
          --  To jump back, press <C-t>.
          map(
            '<leader>cd',
            require('fzf-lua').lsp_definitions,
            '[G]oto [D]efinition'
          )

          -- Find references for the word under your cursor.
          map(
            '<leader>cr',
            require('fzf-lua').lsp_references,
            '[G]oto [R]eferences'
          )

          -- Jump to the implementation of the word under your cursor.
          --  Useful when your language has ways of declaring types without an actual implementation.
          map(
            '<leader>ci',
            require('fzf-lua').lsp_implementations,
            '[G]oto [I]mplementation'
          )

          -- Jump to the type of the word under your cursor.
          --  Useful when you're not sure what type a variable is and you want to see
          --  the definition of its *type*, not where it was *defined*.
          map(
            '<leader>ct',
            require('fzf-lua').lsp_typedefs,
            'Type [D]efinition'
          )

          -- Fuzzy find all the symbols in your current document.
          --  Symbols are things like variables, functions, types, etc.
          map(
            '<leader>cs',
            require('fzf-lua').lsp_document_symbols,
            '[D]ocument [S]ymbols'
          )

          -- Fuzzy find all the symbols in your current workspace.
          --  Similar to document symbols, except searches over your entire project.
          map(
            '<leader>cw',
            require('fzf-lua').lsp_live_workspace_symbols,
            '[W]orkspace [S]ymbols'
          )

          -- Rename the variable under your cursor.
          --  Most Language Servers support renaming across files, etc.
          map('<leader>cn', vim.lsp.buf.rename, '[R]e[n]ame')

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          map(
            '<leader>ca',
            vim.lsp.buf.code_action,
            '[C]ode [A]ction',
            { 'n', 'x' }
          )

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header.
          map('<leader>cD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          vim.keymap.set('n', '<leader>cf', function()
            require('conform').format({
              lsp_format = 'fallback',
            })
          end)

          -- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
          ---@param client vim.lsp.Client
          ---@param method vim.lsp.protocol.Method
          ---@param bufnr? integer some lsp support methods only in specific files
          ---@return boolean
          local function client_supports_method(client, method, bufnr)
            return client:supports_method(method, bufnr)
          end

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if
            client
            and client_supports_method(
              client,
              vim.lsp.protocol.Methods.textDocument_documentHighlight,
              event.buf
            )
          then
            local highlight_augroup = vim.api.nvim_create_augroup(
              'dev-lsp-highlight',
              { clear = false }
            )
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup(
                'dev-lsp-detach',
                { clear = true }
              ),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds({
                  group = 'dev-lsp-highlight',
                  buffer = event2.buf,
                })
              end,
            })
          end

          -- The following code creates a keymap to toggle inlay hints in your
          -- code, if the language server you are using supports them
          --
          -- This may be unwanted, since they displace some of your code
          if
            client
            and client_supports_method(
              client,
              vim.lsp.protocol.Methods.textDocument_inlayHint,
              event.buf
            )
          then
            map('<leader>ch', function()
              vim.lsp.inlay_hint.enable(
                not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf })
              )
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      lspconfig.lua_ls.setup({})
    end,
  },
}
