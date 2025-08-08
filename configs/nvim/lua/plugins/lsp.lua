local Keymap = require('siddthesquid.keymap')

return {
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'j-hui/fidget.nvim', opts = {} },
    config = function()
      local lspconfig = require('lspconfig')

      local original_capabilities = vim.lsp.protocol.make_client_capabilities()
      local capabilities =
        require('blink.cmp').get_lsp_capabilities(original_capabilities)

      vim.lsp.config('*', {
        capabilities = capabilities,
      })

      -- Keybindings
      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = Keymap.lsp_attach(),
      })

      lspconfig.lua_ls.setup({})
      -- lspconfig.bashls.setup({
      --   bashIde = {
      --     globPattern = '**/*@(.sh|.inc|.bash|.command|.zsh)',
      --   },
      -- })
    end,
  },
}
