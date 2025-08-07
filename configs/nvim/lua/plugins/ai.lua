return {
  {
    'supermaven-inc/supermaven-nvim',
    config = function()
      require('supermaven-nvim').setup({
        color = {
          -- for some reason, cterm needs to be set to anything, only then
          -- will suggestion_color work
          -- suggestion_color = '#FFFFFF',
          suggestion_color = '#777777',
          cterm = 255,
        },
        keymaps = {
          accept_suggestion = '<S-Tab>',
        },
      })
    end,
  },
  {
    'olimorris/codecompanion.nvim',
    opts = {
      strategies = {
        chat = {
          adapter = 'gemini',
        },
        inline = {
          adapter = 'gemini',
        },
        cmd = {
          adapter = 'gemini',
        },
      },
      adapters = {
        gemini = function()
          return require('codecompanion.adapters').extend('gemini', {
            schema = {
              model = {
                default = 'gemini-2.5-pro-preview-05-06',
              },
            },
          })
        end,
      },
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
  },
  -- {
  --   'yetone/avante.nvim',
  --   event = 'VeryLazy',
  --   version = false, -- Never set this value to "*"! Never!
  --   opts = {
  --     -- add any opts here
  --     -- for example
  --     provider = 'gemini',
  --     openai = {
  --       endpoint = 'https://api.openai.com/v1',
  --       model = 'gpt-4o', -- your desired model (or use gpt-4o, etc.)
  --       timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
  --       temperature = 0,
  --       max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
  --       --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
  --     },
  --     gemini = {
  --       endpoint = 'https://generativelanguage.googleapis.com/v1beta/models',
  --       model = 'gemini-2.5-pro-preview-03-25',
  --       timeout = 30000, -- Timeout in milliseconds
  --       temperature = 0,
  --       max_tokens = 8192,
  --     },
  --   },
  --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --   build = 'make',
  --   -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  --   dependencies = {
  --     'nvim-treesitter/nvim-treesitter',
  --     'stevearc/dressing.nvim',
  --     'nvim-lua/plenary.nvim',
  --     'MunifTanjim/nui.nvim',
  --     'saghen/blink.cmp',
  --     'ibhagwan/fzf-lua', -- for file_selector provider fzf
  --     'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
  --     'MeanderingProgrammer/render-markdown.nvim',
  --   },
  -- },
}
