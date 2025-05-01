return {
  {
    'olimorris/onedarkpro.nvim',
    priority = 1000, -- Ensure it loads first
    config = function()
      require('onedarkpro').setup({
        highlights = {
          ['@markup.link.url.markdown_inline'] = { link = 'Special' }, -- (url)
          ['@markup.link.label.markdown_inline'] = { link = 'WarningMsg' }, -- [label]
          ['@markup.italic.markdown_inline'] = { link = 'Exception' }, -- *italic*
          ['@markup.raw.markdown_inline'] = { link = 'String' }, -- `code`
          ['@markup.list.markdown'] = { link = 'Function' }, -- + list
          ['@markup.quote.markdown'] = { link = 'Error' }, -- > blockcode
          ['@markup.list.checked.markdown'] = { link = 'WarningMsg' }, -- - [X] checked list item

          -- Don't color the fg of diagnostics
          DiagnosticError = { fg = 'NONE' },
          DiagnosticWarn = { fg = 'NONE' },
          DiagnosticInfo = { fg = 'NONE' },
          DiagnosticHint = { fg = 'NONE' },

          -- Define your custom colored undercurls here as well!
          DiagnosticUnderlineError = { undercurl = true, sp = '#DC2626' },
          DiagnosticUnderlineWarn = { undercurl = true, sp = '#FBBF24' },
          DiagnosticUnderlineInfo = { undercurl = true, sp = '#3B82F6' },
          DiagnosticUnderlineHint = { undercurl = true, sp = '#6B7280' },
        },

        styles = { -- For example, to apply bold and italic, use "bold,italic"
          types = 'bold', -- Style that is applied to types
          methods = 'bold', -- Style that is applied to methods
          numbers = 'NONE', -- Style that is applied to numbers
          strings = 'NONE', -- Style that is applied to strings
          comments = 'italic', -- Style that is applied to comments
          keywords = 'bold,italic', -- Style that is applied to keywords
          constants = 'NONE', -- Style that is applied to constants
          functions = 'bold', -- Style that is applied to functions
          operators = 'NONE', -- Style that is applied to operators
          variables = 'NONE', -- Style that is applied to variables
          parameters = 'bold', -- Style that is applied to parameters
          conditionals = 'italic', -- Style that is applied to conditionals
          virtual_text = 'italic', -- Style that is applied to virtual text
        },

        options = {
          cursorline = true, -- Use cursorline highlighting?
          transparency = false, -- Use a transparent background?
          terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
          lualine_transparency = true, -- Center bar transparency?
          highlight_inactive_windows = false, -- When the window is out of focus, change the normal background?
        },
      })
    end,
  },
}
