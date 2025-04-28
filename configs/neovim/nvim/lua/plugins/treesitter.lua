---@diagnostic disable: missing-fields
return {
  {
    'nvim-treesitter/nvim-treesitter',
    -- Recommended build step to compile parsers locally
    -- Run :TSUpdate if parsers are not installed automatically
    build = ':TSUpdate',
    -- Load early, as many plugins depend on it
    lazy = false,
    -- Alternatively, load on events like BufReadPost/BufNewFile
    -- event = { "BufReadPost", "BufNewFile" },
    opts = {
      -- Ensure parsers for supported languages are installed
      -- Add/remove languages as needed
      ensure_installed = {
        'bash',
        'c',
        'cpp',
        'css',
        'go',
        'html',
        'javascript',
        'json',
        'lua',
        'markdown',
        'markdown_inline', -- Required for markdown code block highlighting
        'python',
        'query', -- Required for Treesitter queries (e.g., for highlighting)
        'rust',
        'tsx',
        'typescript',
        'vim',
        'vimdoc', -- For Neovim help files
        'yaml',
      },

      -- Don't auto install parsers
      auto_install = false,

      -- Enable syntax highlighting
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      -- Treesitter indentation is not great
      indent = {
        enable = false,
      },

      -- Optional: Enable other modules like incremental selection
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<Enter>',
          node_incremental = '<Enter>',
          scope_incremental = '<leader>ts',
          node_decremental = '<Backspace>',
        },
      },

      -- Optional: Configure nvim-treesitter-textobjects if installed
      -- textobjects = {... }
    },
    config = function(_, opts)
      -- Ensure opts is populated correctly before setup
      if type(opts.ensure_installed) == 'table' then
        -- Remove duplicates to avoid potential issues
        local unique_parsers = {}
        for _, parser in ipairs(opts.ensure_installed) do
          unique_parsers[parser] = true
        end
        opts.ensure_installed = {}
        for parser, _ in pairs(unique_parsers) do
          table.insert(opts.ensure_installed, parser)
        end
      end

      -- Call the actual setup function from nvim-treesitter
      require('nvim-treesitter.configs').setup(opts)

      -- Minor optimization: Disable parsing for very large files
      vim.api.nvim_create_autocmd('BufRead', {
        group = vim.api.nvim_create_augroup(
          'MyTreesitterLargeFileDisable',
          { clear = true }
        ),
        pattern = '*',
        callback = function(args)
          local stats = vim.uv.fs_stat(vim.api.nvim_buf_get_name(args.buf))
          if stats and stats.size > 1024 * 1024 then -- 1MB threshold
            vim.cmd('TSBufDisable highlight')
            vim.cmd('TSBufDisable indent')
            -- print("Treesitter disabled for large file.")
          end
        end,
      })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    init = function()
      local config = require('nvim-treesitter.configs')
      config.setup({
        textobjects = {
          select = {
            enable = true,
            lookahead = true,

            keymaps = {
              ['af'] = {
                query = '@function.outer',
                desc = 'Select outer part of a function region',
              },
              ['if'] = {
                query = '@function.inner',
                desc = 'Select inner part of a function region',
              },
              ['ac'] = {
                query = '@class.outer',
                desc = 'Select outer part of a class region',
              },
              ['ao'] = {
                query = '@comment.outer',
                desc = 'Select outer part of a comment region',
              },
              ['ic'] = {
                query = '@class.inner',
                desc = 'Select inner part of a class region',
              },
              ['as'] = {
                query = '@local.scope',
                query_group = 'locals',
                desc = 'Select language scope',
              },
            },

            selection_modes = {
              ['@parameter.outer'] = 'v', -- charwise
              ['@function.outer'] = 'V', -- linewise
              ['@class.outer'] = '<c-v>', -- blockwise
            },

            include_surrounding_whitespace = true,
          },
          swap = {
            enable = true,
            swap_next = {
              ['<leader>s'] = {
                query = '@parameter.inner',
                desc = 'Swap with next parameter',
              },
            },
            swap_previous = {
              ['<leader>S'] = '@parameter.inner',
            },
          },
        },
      })
    end,
  },
}
