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
    '<Cmd>Neotree reveal<CR>',
    { desc = 'Toggle Neotree reveal' }
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
    {
      '<leader>di',
      function()
        require('lsp_lines').toggle()
      end,
      desc = 'Toggle lsp_lines',
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

function M.lsp_attach()
  return function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(
        mode,
        keys,
        func,
        { buffer = event.buf, desc = 'LSP: ' .. desc }
      )
    end

    -- Jump to the definition of the word under your cursor.
    --  This is where a variable was first declared, or where a function is defined, etc.
    --  To jump back, press <C-t>.
    map(
      '<leader>cd',
      require('fzf-lua').lsp_definitions,
      '[G]oto [D]efinition'
    )

    -- Find references for the word under your cursor.
    map(
      '<leader>cr',
      require('fzf-lua').lsp_references,
      '[G]oto [R]eferences'
    )

    -- Jump to the implementation of the word under your cursor.
    --  Useful when your language has ways of declaring types without an actual implementation.
    map(
      '<leader>ci',
      require('fzf-lua').lsp_implementations,
      '[G]oto [I]mplementation'
    )

    -- Jump to the type of the word under your cursor.
    --  Useful when you're not sure what type a variable is and you want to see
    --  the definition of its *type*, not where it was *defined*.
    map(
      '<leader>ct',
      require('fzf-lua').lsp_typedefs,
      'Type [D]efinition'
    )

    -- Fuzzy find all the symbols in your current document.
    --  Symbols are things like variables, functions, types, etc.
    map(
      '<leader>cs',
      require('fzf-lua').lsp_document_symbols,
      '[D]ocument [S]ymbols'
    )

    -- Fuzzy find all the symbols in your current workspace.
    --  Similar to document symbols, except searches over your entire project.
    map(
      '<leader>cw',
      require('fzf-lua').lsp_live_workspace_symbols,
      '[W]orkspace [S]ymbols'
    )

    -- Rename the variable under your cursor.
    --  Most Language Servers support renaming across files, etc.
    map('<leader>cn', vim.lsp.buf.rename, '[R]e[n]ame')

    -- Execute a code action, usually your cursor needs to be on top of an error
    -- or a suggestion from your LSP for this to activate.
    map(
      '<leader>ca',
      vim.lsp.buf.code_action,
      '[C]ode [A]ction',
      { 'n', 'x' }
    )

    -- WARN: This is not Goto Definition, this is Goto Declaration.
    --  For example, in C this would take you to the header.
    map('<leader>cD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

    -- Format current buffer
    map('<leader>cf', function()
      require('conform').format({
        lsp_format = 'fallback',
      })
    end, '[F]ormat buffer')

    -- Toggle inlay hints if supported
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
      map('<leader>ch', function()
        vim.lsp.inlay_hint.enable(
          not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf })
        )
      end, '[T]oggle Inlay [H]ints')
    end
  end
end

return M
