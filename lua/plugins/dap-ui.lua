-- ~/.config/nvim/lua/plugins/dapui.lua
return {
  "rcarriga/nvim-dap-ui",
  dependencies = { "mfussenegger/nvim-dap" },
  config = function(_, opts)
    local dap, dapui = require("dap"), require("dapui")
    dapui.setup(opts)

    -- open when session starts
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    -- prevent auto-close
    dap.listeners.before.event_terminated["dapui_config"] = function() end
    dap.listeners.before.event_exited["dapui_config"] = function() end
  end,
}
