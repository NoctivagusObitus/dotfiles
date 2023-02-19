-- https://alpha2phi.medium.com/neovim-for-beginners-debugging-using-dap-44626a767f57
local M = {}

function M.setup()
  require("dap-go").setup()
end

return M
