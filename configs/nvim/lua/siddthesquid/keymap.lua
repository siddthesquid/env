local M = {}

function M.set_leader(global_key, local_key)
  vim.g.mapleader = global_key
  vim.g.maplocalleader = local_key
end

function M.window_focus()
  vim.keymap.set(
    'n',
    '<C-h>',
    '<C-w><C-h>',
    { desc = 'Move focus to the left window' }
  )
  vim.keymap.set(
    'n',
    '<C-l>',
    '<C-w><C-l>',
    { desc = 'Move focus to the right window' }
  )
  vim.keymap.set(
    'n',
    '<C-j>',
    '<C-w><C-j>',
    { desc = 'Move focus to the lower window' }
  )
  vim.keymap.set(
    'n',
    '<C-k>',
    '<C-w><C-k>',
    { desc = 'Move focus to the upper window' }
  )
end

function M.splits()
  vim.keymap.set('n', '<C-_>', vim.cmd.split, { desc = 'Horizontal split' })
  vim.keymap.set('n', '<C-\\>', vim.cmd.vsplit, { desc = 'Vertical split' })
end

function M.tab_navigations()
  vim.keymap.set(
    'n',
    '[t',
    vim.cmd.tabprevious,
    { desc = 'Go to previous tab' }
  )
  vim.keymap.set('n', ']t', vim.cmd.tabnext, { desc = 'Go to next tab' })
end

-- <leader>c
-- change the location of the color column
function M.color_column()
  vim.keymap.set('n', '<leader>c8', function()
    vim.opt.colorcolumn = '80'
  end, { desc = 'Set colorcolumn to 80', noremap = true, silent = true })
  vim.keymap.set('n', '<leader>c0', function()
    vim.opt.colorcolumn = '100'
  end, { desc = 'Set colorcolumn to 100', noremap = true, silent = true })
  vim.keymap.set('n', '<leader>cc', function()
    vim.opt.colorcolumn = ''
  end, { desc = 'Clear colorcolumn', noremap = true, silent = true })
end

function M.fzf()
  return {
    {
      '<leader>ff',
      function()
        require('fzf-lua').files({
          file_ignore_patterns = { 'external' },
          hidden = true,
          follow = true,
        })
      end,
      desc = 'Find Files in project directory',
    },
    {
      '<leader>fg',
      function()
        require('fzf-lua').live_grep({
          file_ignore_patterns = { 'external' },
          hidden = true,
          follow = true,
        })
      end,
      desc = 'Find by grepping in project directory',
    },
    {
      '<leader>fc',
      function()
        require('fzf-lua').highlights()
      end,
      desc = 'Find in neovim configuration',
    },
    {
      '<leader>fn',
      function()
        require('fzf-lua').files({
          cwd = vim.fn.stdpath('config'),
          file_ignore_patterns = { 'external' },
          hidden = true,
          follow = true,
        })
      end,
      desc = 'Find in neovim configuration',
    },
    {
      '<leader>fh',
      function()
        require('fzf-lua').helptags()
      end,
      desc = '[F]ind [H]elp',
    },
    {
      '<leader>fk',
      function()
        require('fzf-lua').keymaps()
      end,
      desc = '[F]ind [K]eymaps',
    },
    -- nvim options
    {
      '<leader>fo',
      function()
        require('fzf-lua').nvim_options()
      end,
      desc = '[F]ind Neovim [O]ptions',
    },
    {
      '<leader>fb',
      function()
        require('fzf-lua').builtin()
      end,
      desc = '[F]ind [B]uiltin FZF',
    },
    {
      '<leader>fw',
      function()
        require('fzf-lua').grep_cword({
          file_ignore_patterns = { 'external' },
          hidden = true,
          follow = true,
        })
      end,
      desc = '[F]ind current [W]ord',
    },
    {
      '<leader>fW',
      function()
        require('fzf-lua').grep_cWORD({
          file_ignore_patterns = { 'external' },
          hidden = true,
          follow = true,
        })
      end,
      desc = '[F]ind current [W]ORD',
    },
    {
      '<leader>fd',
      function()
        require('fzf-lua').diagnostics_document()
      end,
      desc = '[F]ind [D]iagnostics',
    },
    {
      '<leader>fr',
      function()
        require('fzf-lua').resume()
      end,
      desc = '[F]ind [R]esume',
    },
    {
      '<leader><leader>',
      function()
        require('fzf-lua').buffers()
      end,
      desc = '[,] Find existing buffers',
    },
    -- lsp
    {
      '<leader>fs',
      function()
        require('fzf-lua').lsp_live_workspace_symbols()
      end,
      desc = '[f]ind LSP workspace [s]ymbols',
    },
    {
      '<leader>/',
      function()
        require('fzf-lua').lgrep_curbuf()
      end,
      desc = '[/] Live grep the current buffer',
    },
  }
end

function M.tree()
  vim.keymap.set(
    'n',
    '<leader>ee',
    ':NvimTreeToggle<CR>',
    { desc = 'Toggle NvimTree' }
  )
end

function M.diagnostics()
  return {
    {
      '<leader>dd',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Diagnostics (Trouble)',
    },
    {
      '<leader>dD',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = 'Buffer Diagnostics (Trouble)',
    },
    {
      '<leader>ds',
      '<cmd>Trouble symbols toggle focus=false<cr>',
      desc = 'Symbols (Trouble)',
    },
    {
      '<leader>dl',
      '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
      desc = 'LSP Definitions / references / ... (Trouble)',
    },
    {
      '<leader>dL',
      '<cmd>Trouble loclist toggle<cr>',
      desc = 'Location List (Trouble)',
    },
    {
      '<leader>dQ',
      '<cmd>Trouble qflist toggle<cr>',
      desc = 'Quickfix List (Trouble)',
    },
  }
end

-- "g" for "go to this word"
function M.hop()
  local hop = require('hop')
  vim.keymap.set(
    { 'i', 'n', 'v' },
    '<C-g>',
    hop.hint_words,
    { desc = 'Hop to any word' }
  )
  vim.keymap.set(
    { 'n', 'v' },
    '<leader>gl',
    hop.hint_lines,
    { desc = 'Hop to any line' }
  )
end

return M
