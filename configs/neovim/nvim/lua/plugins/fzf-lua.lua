local Keymap = require("siddthesquid.keymap")

return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
  keys = Keymap.fzf(),
}
