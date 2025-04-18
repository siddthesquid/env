local Keymap = require('siddthesquid.keymap')

Keymap.set_leader(' ', ' ')
Keymap.color_column()
Keymap.window_focus()
Keymap.splits()
Keymap.tab_navigations()

require('core.general')
require('core.display')
-- require("core.keymap")
require('core.lazy')
