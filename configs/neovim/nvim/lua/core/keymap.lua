-- source current file, line, selection
vim.keymap.set("n", "<space>lf", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>ll", ":.lua<CR>")
vim.keymap.set("v", "<space>ls", ":lua<CR>")

-- Remap leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- <leader>p
-- project view
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- <leader>c
-- change the location of the color column
vim.keymap.set(
  'n',
  '<leader>c8',
  function() vim.opt.colorcolumn = "80" end,
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  '<leader>c0',
  function() vim.opt.colorcolumn = "100" end,
  { noremap = true, silent = true }
)
vim.keymap.set(
  'n',
  '<leader>cc',
  function() vim.opt.colorcolumn = "" end,
  { noremap = true, silent = true }
)

