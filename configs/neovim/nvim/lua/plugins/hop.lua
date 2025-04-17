local Keymap = require("siddthesquid.keymap")

return {
  'smoka7/hop.nvim',
  config = function()
    local hop = require("hop")

    hop.setup({ keys = 'etovxqpdygfblzhckisuran' })
    Keymap.hop()
  end
}
