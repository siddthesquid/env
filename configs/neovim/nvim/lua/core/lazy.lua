local Path = require("siddthesquid.path")

-- where https://github.com/folke/lazy.nvim is cloned
local lazypath = Path.external .. "/lazy.nvim"

-- if lazy exists in lazypath, then source it and use the "plugins" module
-- to define specs
if vim.uv.fs_stat(lazypath) then
  vim.opt.rtp:prepend(lazypath)
  -- require("lazy").setup("plugins")
  require("lazy").setup({
    spec = "plugins",
    change_detection = {
      enabled = false,
      notify = false
    }
  })
end
