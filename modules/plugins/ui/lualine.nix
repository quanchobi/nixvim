{ config, lib, ... }:
let
  colors = config.colorschemes.base16.colorscheme;
in
{
  plugins.lualine = {
    enable = true;
    settings = {
      options = {
        theme = {
          normal = {
            a = {
              bg = colors.base01;
            };
            b = {
              bg = colors.base01;
            };
            c = {
              bg = colors.base01;
            };
            z = {
              bg = colors.base01;
            };
            y = {
              bg = colors.base01;
            };
          };
        };
        globalstatus = true;
        disabled_filetypes = {
          statusline = [
            "dashboard"
            "alpha"
            "starter"
            "snacks_dashboard"
          ];
        };
      };
      inactive_sections = {
        lualine_x = [
          "filename"
          "filetype"
        ];
      };
      sections = {
        lualine_a = [
          {
            __unkeyed = "mode";
            fmt = "string.lower";
            color = {
              fg = colors.base04;
              bg = colors.base01;
            };
            separator.left = "";
            separator.right = "";
          }
        ];
        lualine_b = [
          {
            __unkeyed = "branch";
            icon.__unkeyed = "";
            color = {
              fg = colors.base04;
              bg = colors.base01;
            };
            separator.left = "";
            separator.right = "";
          }
          {
            __unkeyed = "diff";
            separator.left = "";
            separator.right = "";
          }
        ];
        lualine_c = [
          {
            __unkeyed = "diagnostic";
            symbols = {
              error = " ";
              warn = " ";
              info = " ";
              hint = "󰝶 ";
            };
            color = {
              fg = colors.base08;
              bg = colors.base01;
            };
            separator.left = "";
            separator.right = "";
          }
        ];
        lualine_x = [ "" ];
        lualine_y = [
          {
            __unkeyed = "filetype";
            icon_only = true;
            separator.left = "";
            separator.right = "";
          }
          {
            __unkeyed = "filename";
            symbols = {
              modified = "";
              readonly = "👁️";
              unnamed = "";
            };
            color = {
              fg = colors.base05;
              bg = colors.base01;
            };
            separator.left = "";
            separator.right = "";
          }
        ];
        lualine_z = [
          {
            __unkeyed = "location";
            color = {
              fg = colors.base0B;
              bg = colors.base01;
            };
            separator.left = "";
            separator.right = "";
          }
        ];
      };
    };
  };
}
