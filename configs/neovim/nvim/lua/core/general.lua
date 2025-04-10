-- line numbers
vim.opt.nu = true

-- indenting
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- todo: what is this really??
vim.opt.smartindent = true

-- searching for text in the selected buffer
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- keep at least N lines around cursor when scrolling
vim.opt.scrolloff = 8

-- tool specific column in editor to annotate line
vim.opt.signcolumn = "yes"

-- allow @ in filenames
vim.opt.isfname:append("@-@")

-- fast update time
vim.opt.updatetime = 50

-- where to open splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- yank to clipboard
vim.opt.clipboard:append("unnamedplus")

-- todo: what is this
vim.opt.backspace = { "indent", "eol", "start" }

-- my personal opinion, the below is generally more consistent.
-- vim.opt.virtualedit = 'onemore'
-- vim.keymap.set('i', '<Esc>', '<Esc>l', { noremap = true })

