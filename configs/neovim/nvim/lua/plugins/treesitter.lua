local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function () 
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "c",
        "markdown",
        "query",
        "json",
        "lua",
        "vim",
        "vimdoc",
        "javascript",
        "typescript",
        "rust",
        "cpp",
        "html",
        "python",
        "bash"
      },
      auto_install = false,
      sync_install = false,

      highlight = {
        enable = true,

        -- disable syntax highlighting if file is too big
        disable = function(lang, buf)
          local max_filesize = 1000 * 1024 -- 1 MB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,

        -- not sure what this is
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },  
    })
  end
}

return { M }
