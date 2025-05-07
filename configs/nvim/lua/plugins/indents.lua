return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  opts = {},
  config = function()
    require('ibl').setup()
    local blanklineGrp =
      vim.api.nvim_create_augroup('BlankLine', { clear = true })
    vim.api.nvim_create_autocmd(
      { 'InsertLeave', 'WinEnter' },
      { pattern = '*', command = ':IBLEnable', group = blanklineGrp }
    )
    vim.api.nvim_create_autocmd(
      { 'InsertEnter', 'WinLeave' },
      { pattern = '*', command = ':IBLDisable', group = blanklineGrp }
    )
  end,
}
