local M = {}

M.data = vim.fn.stdpath('data')
M.config = vim.fn.stdpath('config')
M.cache = vim.fn.stdpath('cache')
M.state = vim.fn.stdpath('state')
M.run = vim.fn.stdpath('run')
M.log = vim.fn.stdpath('log')

M.external = M.config .. '/external'

return M
