return {
  {
    'isovector/cornelis',
    name = 'cornelis',
    ft = 'agda',
    version = '*',
    build = 'cabal install --overwrite-policy=always',
    dependencies = {
      'neovimhaskell/nvim-hs.vim',
      'kana/vim-textobj-user',
      'liuchengxu/vim-which-key',
    },
    config = function()
      vim.g.cornelis_agda_prefix = '\\'
    end,
  },
}
