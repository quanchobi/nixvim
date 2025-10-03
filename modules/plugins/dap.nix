{ pkgs, ... }:
{
  plugins = {
    cmp-dap.enable = true;
    dap-virtual-text.enable = true;

    dap-python = {
      enable = true;
      pythonPath = "${pkgs.python3}/bin/python";
    };

    dap-ui = {
      enable = true;
      settings.floating.mappings = {
        close = [
          "<ESC>"
          "q"
        ];
      };
    };

    dap = {
      enable = true;
      extensions = {

      };
      signs = {
        dapBreakpoint = {
          text = "";
          texthl = "DapBreakpoint";
        };
        dapBreakpointCondition = {
          text = "";
          texthl = "DapBreakpointCondition";
        };
        dapLogPoint = {
          text = "";
          texthl = "DapLogPoint";
        };
      };
    };
  };

  keymaps = [
    {
      key = "<F5>";
      action = "require('dap').continue";
      options.desc = "DAP: Continue";
    }
    {
      key = "<F6>";
      action = "require('dap').terminate";
      options.desc = "DAP: Terminate";
    }
    {
      key = "<F7>";
      action = "require('dap').step_over";
      options.desc = "DAP: Step Over";
    }
    {
      key = "<F8>";
      action = "require('dap').step_into";
      options.desc = "DAP: Step Into";
    }
    {
      key = "<F9>";
      action = "require('dap').step_out";
      options.desc = "DAP: Step Out";
    }
    {
      mode = "n";
      key = "<leader>b";
      action = "require('dap').toggle_breakpoint";
      options.desc = "DAP: Toggle Breakpoint";
    }
    {
      mode = "n";
      key = "<leader>B";
      action = ''
        function()
          require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))
        end
      '';
      options.desc = "DAP: Set Conditional Breakpoint";
    }
    {
      mode = "n";
      key = "<leader>dl";
      action = "require('telescope').extensions.dap.list_breakpoints";
      options.desc = "DAP: List Breakpoints";
    }
    {
      mode = "n";
      key = "<leader>dv";
      action = "require('telescope').extensions.dap.variables";
      options.desc = "DAP: Variables";
    }
    {
      mode = "n";
      key = "<leader>dc";
      action = "require('telescope').extensions.dap.commands";
      options.desc = "DAP: Commands";
    }
  ];

  # Allow DAP UI to automatically open and close when possible
  extraConfigLua = ''
    require('dap').listeners.after.event_initialized['dapui_config'] = require('dapui').open
    require('dap').listeners.before.event_terminated['dapui_config'] = require('dapui').close
    require('dap').listeners.before.event_exited['dapui_config'] = require('dapui').close
  '';

  extraPlugins = [ pkgs.vimPlugins.telescope-dap-nvim ];
}

