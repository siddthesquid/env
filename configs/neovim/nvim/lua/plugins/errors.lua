local Keymap = require("siddthesquid.keymap")

return {
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()

      vim.keymap.set(
        "",
        "<leader>di",
        require("lsp_lines").toggle,
        { desc = "Toggle lsp_lines" }
      )

    end,
  },
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    config = function()
      require("trouble").setup({})
    end,
    keys = Keymap.diagnostics(),
  },
}

