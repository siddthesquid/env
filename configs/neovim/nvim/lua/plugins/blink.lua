return {
  {
    'saghen/blink.compat',
    version = '*',
    lazy = true,
    opts = {},
  },
  {
    'saghen/blink.cmp',
    build = 'cargo build --release',

    dependencies = {
      'moyiz/blink-emoji.nvim',
      'MahanRahmati/blink-nerdfont.nvim',
      'jdrupal-dev/css-vars.nvim',
      'Kaiser-Yang/blink-cmp-avante',
    },

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = 'default' },

      appearance = {
        nerd_font_variant = 'mono',
      },

      completion = {
        documentation = {
          auto_show = true,
          window = { border = 'single' },
        },
        menu = { border = 'single' },
      },

      signature = {
        enabled = true,
        window = { border = 'single' },
      },

      sources = {
        default = {
          'avante',
          'lazydev',
          'lsp',
          'path',
          'nerdfont',
          'emoji',
          'snippets',
          'css_vars',
        },
        providers = {
          lazydev = {
            name = 'LazyDev',
            module = 'lazydev.integrations.blink',
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
          nerdfont = {
            module = 'blink-nerdfont',
            name = 'Nerd Fonts',
            score_offset = 15, -- Tune by preference
            opts = { insert = true }, -- Insert nerdfont icon (default) or complete its name
          },
          emoji = {
            module = 'blink-emoji',
            name = 'Emoji',
            score_offset = 15, -- Tune by preference
            opts = { insert = true }, -- Insert emoji (default) or complete its name
          },
          css_vars = {
            name = 'CSS Vars',
            module = 'css-vars.blink',
            opts = {
              -- WARNING: The search is not optimized to look for variables in JS files.
              -- If you change the search_extensions you might get false positives and weird completion results.
              search_extensions = { '.js', '.ts', '.jsx', '.tsx' },
            },
          },
          avante = {
            module = 'blink-cmp-avante',
            name = 'Avante',
            opts = {
              -- options for blink-cmp-avante
            },
          },
        },
      },

      fuzzy = { implementation = 'prefer_rust_with_warning' },
    },
    opts_extend = { 'sources.default' },
  },
}
