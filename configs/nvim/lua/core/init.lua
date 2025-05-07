vim.api.nvim_create_autocmd('DirChanged', {
  callback = function(args)
    vim.print(
      'Dir changed from '
        .. args.match
        .. ' because of '
        .. debug.traceback('', 2)
    )
  end,
})

vim.opt.termguicolors = true

local Keymap = require('siddthesquid.keymap')

Keymap.set_leader(' ', ' ')
Keymap.color_column()
Keymap.window_focus()
Keymap.splits()
Keymap.tab_navigations()

require('core.general')
require('core.display')
require('core.lsps')
-- require("core.keymap")
require('core.lazy')

vim.cmd([[colorscheme onedark_dark]])
