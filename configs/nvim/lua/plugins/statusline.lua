local function breadcrumbs()
  local str = require('lspsaga.symbol.winbar').get_bar()
  if str == nil then
    return ''
  end
  return str
end

return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = {
          icons_enabled = true,
          theme = 'codedark',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = {
            statusline = {
              -- 'AvanteInput',
              -- 'AvanteSelectedFiles',
              -- 'Avante',
              -- 'neo-tree',
              -- 'help',
            },
            winbar = {
              'AvanteInput',
              'AvanteSelectedFiles',
              'Avante',
              'codecompanion',
              'neo-tree',
              'help',
              'agdainfo',
            },
          },
          ignore_focus = {},
          always_divide_middle = true,
          always_show_tabline = true,
          globalstatus = true,
          refresh = {
            statusline = 100,
            tabline = 100,
            winbar = 100,
          },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = {
            {
              'diagnostics',
              update_in_insert = true,
            },
          },
          lualine_c = {
            {
              'diff',
              -- symbols = { added = ' ', modified = ' ', removed = ' ' },
              symbols = { added = '+', modified = '~', removed = '-' },
            },
          },
          lualine_x = { breadcrumbs },
          lualine_y = { 'lsp_status' },
          lualine_z = { 'filetype' },
        },
        tabline = {
          lualine_a = {
            {
              'tabs',
              max_length = 300,
              mode = 1,
              symbols = {
                modified = '',
              },
            },
          },
          lualine_x = {
            { 'buffers' },
          },
        },
        winbar = {
          -- lualine_a = {},
          lualine_a = { { 'filename', path = 1 } },
          -- lualine_b = { { 'filename', path = 1 } },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        inactive_winbar = {
          -- lualine_a = {},
          lualine_a = { { 'filename', path = 1 } },
          -- lualine_b = { { 'filename', path = 1 } },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        extensions = {},
      })
    end,
  },
}
