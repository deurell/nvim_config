return {
  "mfussenegger/nvim-dap",
  init = function()
    local LazyVim = require("lazyvim.util")

    local function alias_codelldb()
      local dap = require("dap")
      if dap.adapters.codelldb then
        -- forward lldb adapter to codelldb so the mapping is set once
        dap.adapters.lldb = dap.adapters.codelldb
      end
    end

    LazyVim.on_load("mfussenegger/nvim-dap", alias_codelldb)
    LazyVim.on_load("mason-nvim-dap.nvim", alias_codelldb)
  end,
  keys = {
    {
      "<f5>",
      function()
        require("dap").continue()
      end,
      desc = "start/continue debugging",
    },
    {
      "<f4>",
      function()
        require("dap").run({
          type = "codelldb",
          request = "launch",
          name = "run my executable",
          program = "/Users/mikael/projects/defold/tmp/dynamo_home/bin/arm64-macos/dmengine",
          args = {
            "/Users/mikael/projects/defold/tmp/dynamo_home/bin/arm64-macos/defold-test-box2d-30/build/default/game.projectc",
          },
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        })
      end,
      desc = "run with executable and args",
    },
    {
      "<f10>",
      function()
        require("dap").step_over()
      end,
      desc = "step over",
    },
    {
      "<f11>",
      function()
        require("dap").step_into()
      end,
      desc = "step into",
    },
    {
      "<f12>",
      function()
        require("dap").step_out()
      end,
      desc = "step out",
    },
    {
      "<f9>",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "toggle breakpoint",
    },
    {
      "<leader>dr",
      function()
        require("dap").repl.open()
      end,
      desc = "open debug repl",
    },
    {
      "<leader>dl",
      function()
        require("dap").run_last()
      end,
      desc = "run last debug",
    },
  },
}
