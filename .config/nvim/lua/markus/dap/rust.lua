local dap = require('dap')
dap.adapters.codelldb = {
  type = 'server',
  host = '127.0.0.1',
  port = 13000, -- 💀 Use the port printed out or specified with `--port`
  executable = {
    -- CHANGE THIS to your path!
    command = 'lldb-vscode',
    args = { "--port", "13000" },

    -- On windows you may have to uncomment this:
    -- detached = false,
  }
}
