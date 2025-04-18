local Keymap = require('siddthesquid.keymap')

return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    config = function()
      require('oil').setup({})
      Keymap.oil()
    end,
  },
}
