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

          -- Background will already be black. make it transparent here
          Normal = { bg = 'NONE', extend = true },
          SignColumn = { bg = 'NONE', extend = true },
          LineNr = { bg = 'NONE', extend = true },

          -- Brighter cursor line and selection colors
          CursorLine = { bg = '#4A4B42' },
          CursorLineNr = { fg = '#F8F8F2' },
          MatchWord = { bg = '#2A2B32' },
          Visual = { bg = '#3A3B42' },
          VisualNOS = { bg = '#3A3B42' },
          Pmenu = { link = 'NormalFloat' },
          PmenuSel = { bg = '#3B82F6' },
          Search = { bg = '#3B82F6' },
          IncSearch = { bg = '#3B82F6' },

          -- This is black otherwise and ruins ceretain elements
          NonText = { bg = 'NONE' },

          -- I like comments sticking out
          Comment = { fg = '#AAAAAA', italic = true },

          -- Markdown code background
          RenderMarkdownCode = { bg = '#2A2B32' },

          -- Supermaven (not working)
          -- SupermavenSuggestion = {
          --   undercurl = true,
          --   sp = '#3B82F6',
          --   fg = '#3B82F6',
          -- },

          -- markdownCode = { bg = '#2A2B32' },
          -- IndentLine = { link = 'CursorColumn', fg = '#3B82F6' },
          -- IblWhitespace = { link = 'CursorColumn', fg = '#3B82F6' },
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
          highlight_inactive_windows = true, -- When the window is out of focus, change the normal background?
        },
      })
    end,
  },
}
