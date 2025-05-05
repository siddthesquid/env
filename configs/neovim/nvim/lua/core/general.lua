-- line numbers
vim.opt.nu = true

-- enable mouse mode
vim.opt.mouse = 'a'

-- indenting
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- todo: what is this really??
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.autoindent = true

-- searching for text in the selected buffer. Use \C or capital letters for
-- case sensitive matching
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- live substitutions
vim.opt.inccommand = 'split'

-- Save undo history
vim.opt.undofile = true

-- keep at least N lines around cursor when scrolling
vim.opt.scrolloff = 16

-- tool specific column in editor to annotate line
vim.opt.signcolumn = 'yes'

-- allow @ in filenames
vim.opt.isfname:append('@-@')

-- Show which line your cursor is on
vim.opt.cursorline = true

-- fast update time
vim.opt.updatetime = 50

-- where to open splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- yank to clipboard
vim.opt.clipboard:append('unnamedplus')

-- todo: what is this
vim.opt.backspace = { 'indent', 'eol', 'start' }

-- my personal opinion, the below is generally more consistent.
-- but currently disabled because it's annoying at the beginning of a line
-- vim.opt.virtualedit = 'onemore'
-- vim.keymap.set('i', '<Esc>', '<Esc>l', { noremap = true })

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- ask if you want to save when quitting
vim.opt.confirm = true

-- diagnostics
vim.diagnostic.config({
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  },
})

-- Error: Red undercurl
vim.api.nvim_set_hl(
  0,
  'DiagnosticUnderlineError',
  { undercurl = true, sp = '#DC2626' }
) -- A bright red

-- Warning: Orange/Yellow undercurl
vim.api.nvim_set_hl(
  0,
  'DiagnosticUnderlineWarn',
  { undercurl = true, sp = '#FBBF24' }
) -- Amber/Yellow

-- Info: Blue undercurl
vim.api.nvim_set_hl(
  0,
  'DiagnosticUnderlineInfo',
  { undercurl = true, sp = '#3B82F6' }
) -- A medium blue

-- Hint: Gray or Green undercurl
vim.api.nvim_set_hl(
  0,
  'DiagnosticUnderlineHint',
  { undercurl = true, sp = '#6B7280' }
) -- A cool gray (or choose a green like #10B981)

-- don't auto comment next line after comment
vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function()
    vim.opt_local.formatoptions:remove({ 'r', 'o' })
  end,
})

-- global status line
