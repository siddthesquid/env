vim.lsp.config.bashls = {
  cmd = { 'bash-language-server', 'start' },
  filetypes = { 'bash', 'sh', 'zsh' },
}
vim.lsp.enable('bashls')

vim.lsp.enable('jsonls')
vim.lsp.config('jsonls', {
  cmd = { 'vscode-json-language-server', '--stdio' },
  filetypes = { 'json', 'jsonc' },
  init_options = {
    provideFormatter = false,
  },
  root_markers = { '.git' },
  settings = {
    json = {
      format = {
        enable = false,
        keepLines = false,
      },
    },
  },
})
