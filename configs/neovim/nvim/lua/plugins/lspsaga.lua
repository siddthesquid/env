return {
  'nvimdev/lspsaga.nvim',
  config = function()
    -- require('lspsaga').setup({})
  end,
  event = 'LspAttach',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
}
