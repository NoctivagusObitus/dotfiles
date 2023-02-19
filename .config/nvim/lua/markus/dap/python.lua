-- https://alpha2phi.medium.com/neovim-for-beginners-debugging-using-dap-44626a767f57
local M = {}

function M.setup()
  local dap_python = require('dap-python')
  dap_python.test_runner = 'pytest'
  dap_python.setup('python')
end

return M
