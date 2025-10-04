-- return {
--   {
--     'isovector/cornelis',
--     name = 'cornelis',
--     ft = 'agda',
--     version = '*',
--     build = 'cabal install --overwrite-policy=always',
--     dependencies = {
--       'neovimhaskell/nvim-hs.vim',
--       'kana/vim-textobj-user',
--     },
--     config = function()
--       vim.g.cornelis_agda_prefix = '\\'
--     end,
--   },
-- }
return {
  {
    'isovector/cornelis',
    name = 'cornelis',
    ft = 'agda',
    version = 'v2.7.1',
    build = 'cabal install --overwrite-policy=always',
    dependencies = {
      'neovimhaskell/nvim-hs.vim',
      'kana/vim-textobj-user',
    },
    config = function()
      -- Use backslash as Agda prefix (same as your example)
      vim.g.cornelis_agda_prefix = '\\'
      vim.g.cornelis_max_size = 30

      vim.fn['cornelis#bind_input']('p2', '″') -- U+2033 DOUBLE PRIME
      vim.fn['cornelis#bind_input']('p3', '‴') -- U+2034 TRIPLE PRIME
      vim.fn['cornelis#bind_input']('p4', '⁗') -- U+2057 QUADRUPLE PRIME

      local aug = vim.api.nvim_create_augroup
      local ac = vim.api.nvim_create_autocmd
      local km = function(lhs, rhs, desc)
        vim.keymap.set(
          'n',
          lhs,
          rhs,
          { buffer = true, silent = true, desc = desc }
        )
      end

      -- Close Cornelis info windows when quitting Agda buffers
      ac('QuitPre', {
        pattern = '*.agda',
        group = aug('cornelis_close_on_quit', { clear = true }),
        callback = function()
          vim.cmd('CornelisCloseInfoWindows')
        end,
      })

      -- Buffer-local keymaps for Agda (all start with <leader>a)
      ac('FileType', {
        pattern = 'agda',
        group = aug('cornelis_agda_keys', { clear = true }),
        callback = function()
          km('<leader>al', '<cmd>CornelisLoad<CR>', 'Cornelis: Load')
          km('<leader>ar', '<cmd>CornelisRefine<CR>', 'Cornelis: Refine')
          km('<leader>ac', '<cmd>CornelisMakeCase<CR>', 'Cornelis: Make Case')
          km(
            '<leader>a,',
            '<cmd>CornelisTypeContext<CR>',
            'Cornelis: Type Context (explicit)'
          )
          km(
            '<leader>a.',
            '<cmd>CornelisTypeContextInfer<CR>',
            'Cornelis: Type Context (infer)'
          )
          km('<leader>as', '<cmd>CornelisSolve<CR>', 'Cornelis: Solve')
          km('<leader>aa', '<cmd>CornelisAuto<CR>', 'Cornelis: Auto')

          -- Mappings that originally weren’t leader-based, now prefixed with <leader>a
          km(
            '<leader>aG',
            '<cmd>CornelisGoToDefinition<CR>',
            'Cornelis: Go to Definition'
          )
          km(
            '<leader>ag',
            '<cmd>CornelisGive<CR>',
            'Cornelis: Go to Definition'
          )
          km(
            '<leader>a[',
            '<cmd>CornelisPrevGoal<CR>',
            'Cornelis: Previous Goal'
          )
          km('<leader>a]', '<cmd>CornelisNextGoal<CR>', 'Cornelis: Next Goal')
          km('<leader>ai', '<cmd>CornelisInc<CR>', 'Cornelis: Increase Number')
          km('<leader>ad', '<cmd>CornelisDec<CR>', 'Cornelis: Decrease Number')
        end,
      })

      -- Auto-load on save (spicy)
      ac('BufWritePost', {
        pattern = '*.agda',
        group = aug('cornelis_autoload_on_save', { clear = true }),
        callback = function()
          vim.cmd('CornelisLoad')
        end,
      })

      -- Auto-load on open if Cornelis is available
      local function CornelisLoadWrapper()
        if vim.fn.exists(':CornelisLoad') == 2 then
          vim.cmd('CornelisLoad')
        end
      end

      ac('BufReadPre', {
        pattern = { '*.agda', '*.lagda*' },
        group = aug('cornelis_autoload_on_open', { clear = true }),
        callback = CornelisLoadWrapper,
      })
    end,
  },
}
