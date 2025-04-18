function TestHighlightStyles()
  local buf = vim.api.nvim_create_buf(false, true) -- [listed=false, scratch=true]
  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = 60,
    height = 10,
    row = 5,
    col = 10,
    style = 'minimal',
    border = 'rounded',
  })

  -- Define custom highlight groups
  vim.api.nvim_set_hl(0, 'FgOnly', { fg = '#ff5555' })
  vim.api.nvim_set_hl(0, 'BgOnly', { bg = '#2222aa' })
  vim.api.nvim_set_hl(0, 'FgBg', { fg = '#ffffff', bg = '#5f00af' })
  vim.api.nvim_set_hl(
    0,
    'UnderlineDefault',
    { underline = true, fg = '#ffffff' }
  )
  vim.api.nvim_set_hl(
    0,
    'UnderlineColor',
    { underline = true, sp = '#00ffff', fg = '#ffffff' }
  )
  vim.api.nvim_set_hl(
    0,
    'UndercurlColor',
    { undercurl = true, sp = '#ff00ff', fg = '#ffffff' }
  )

  -- Add lines of test text
  local lines = {
    'This is only FG color (red)',
    'This is only BG color (blue)',
    'This is FG + BG (white on purple)',
    'This has underline (default color)',
    'This has underline with custom color (cyan)',
    'This has undercurl with custom color (magenta)',
  }

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  -- Apply highlights using extmarks
  local ns = vim.api.nvim_create_namespace('HighlightTest')
  for i = 0, #lines - 1 do
    local hl_group = ({
      'FgOnly',
      'BgOnly',
      'FgBg',
      'UnderlineDefault',
      'UnderlineColor',
      'UndercurlColor',
    })[i + 1]

    vim.api.nvim_buf_set_extmark(buf, ns, i, 0, {
      end_col = #lines[i + 1],
      hl_group = hl_group,
    })
  end
end
