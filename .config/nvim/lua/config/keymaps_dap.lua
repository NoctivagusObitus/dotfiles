local opts = { noremap = true, silent = true }
local keymap = vim.keymap

opts.desc = "Toggle DAP UI"
keymap.set("n", "<F1>", "<cmd>lua require'dapui'.toggle()<cr>", opts)
opts.desc = "DAP Toggle Breakpoint"
keymap.set("n", "<F3>", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
opts.desc = "DAP Continue"
keymap.set("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", opts)
opts.desc = "DAP Debug Go Test"
keymap.set("n", "<S-F5>", "<cmd>lua require'dap-go'.debug_test()<cr>", opts)
-- da.test_,method() is not a function > use python testling like for go (line above)
-- opts.desc = "DAP Debug Python Test"
-- keymap.set("n", "<C-F5>", "<cmd>lua require'dap'.test_method()<cr>", opts)
opts.desc = "DAP Run to Cursor"
keymap.set("n", "<F6>", "<cmd>lua require'dap'.run_to_cursor()<cr>", opts)
opts.desc = "DAP Start REPL"
keymap.set("n", "<F8>", "<cmd>lua require'dap'.repl_open()<cr>", opts)
opts.desc = "DAP Step Over"
keymap.set("n", "<F10>", "<cmd>lua require'dap'.step_over()<cr>", opts)
opts.desc = "DAP Step Back"
keymap.set("n", "<S-F10>", "<cmd>lua require'dap'.step_back()<cr>", opts)
opts.desc = "DAP Step Into"
keymap.set("n", "<F11>", "<cmd>lua require'dap'.step_into()<cr>", opts)
opts.desc = "DAP Step Out"
keymap.set("n", "<S-F11>", "<cmd>lua require'dap'.step_oute()<cr>", opts)
opts.desc = "DAP Terminate"
keymap.set("n", "<F12>", "<cmd>lua require'dap'.terminate()<cr>", opts)

--function M.setup()
--  local keymap = {
--    d = {
--      R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
--      E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
--      C = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
--      U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
--      b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
--      c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
--      d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
--      e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
--      g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
--      h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
--      S = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
--      i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
--      o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
--      p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
--      q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
--      r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
--      s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
--      T = { "<cmd>lua require'dap'.debug_test()<cr>", "Debug Test" },
--      t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
--      x = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
--      u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
--      name = "Debug",
--    },
--  }
--
--  whichkey.register(keymap, {
--    mode = "n",
--    prefix = "<leader>",
--    buffer = nil,
--    silent = true,
--    noremap = true,
--    nowait = false,
--  })
--
--  local keymap_v = {
--    name = "Debug",
--    e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
--  }
--  whichkey.register(keymap_v, {
--    mode = "v",
--    prefix = "<leader>",
--    buffer = nil,
--    silent = true,
--    noremap = true,
--    nowait = false,
--  })
--end
