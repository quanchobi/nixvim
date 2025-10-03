{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimPlugins; [
    friendly-snippets
    luasnip
    cmp-nvim-lsp
    blink-compat
  ];

  plugins = {
    cmp-calc.enable = true;
    cmp-emoji.enable = true;
    cmp-git.enable = true;
    cmp-spell.enable = true;
    cmp-treesitter.enable = true;
    blink-ripgrep.enable = true;

    blink-compat = {
      enable = true;
      settings = {
        debug = false;
        impersonate_nvim_cmp = true;
      };
    };

    luasnip = {
      enable = true;
      settings.enable_autosnippets = true;
      fromVscode = [
        {
          paths = "${pkgs.vimPlugins.friendly-snippets}";
        }
      ];
    };

    lsp.capabilities = # Lua
      ''
        capabilities = vim.tbl_deep_extend('force', capabilities, require('blink.cmp').get_lsp_capabilities())
      '';

    blink-cmp = {
      enable = true;

      settings = {
        keymap = {
          preset = "cmdline";
        };

        signature = {
          enabled = true;
        };

        sources = {
          default = [
            "buffer"
            "calc"
            "emoji"
            "ripgrep"
            "git"
            "lsp"
            "path"
            "snippets"
            "spell"
            "treesitter"
          ];
          providers = {
            calc = {
              name = "calc";
              module = "blink.compat.source";
            };
            emoji = {
              name = "emoji";
              module = "blink.compat.source";
            };
            git = {
              name = "git";
              module = "blink.compat.source";
            };
            ripgrep = {
              name = "Ripgrep";
              module = "blink-ripgrep";
              score_offset = 1;
            };
            spell = {
              name = "spell";
              module = "blink.compat.source";
            };
            treesitter = {
              name = "treesitter";
              module = "blink.compat.source";
            };
          };
        };

        appearance = {
          use_nvim_cmp_as_default = false;
          nerd_font_variant = "mono";
          kind_icons = {
            Text = "󰉿";
            Method = "";
            Function = "󰊕";
            Constructor = "󰒓";

            Field = "󰜢";
            Variable = "󰆦";
            Property = "󰖷";

            Class = "󱡠";
            Interface = "󱡠";
            Struct = "󱡠";
            Module = "󰅩";

            Unit = "󰪚";
            Value = "󰦨";
            Enum = "󰦨";
            EnumMember = "󰦨";

            Keyword = "󰻾";
            Constant = "󰏿";

            Snippet = "󱄽";
            Color = "󰏘";
            File = "󰈔";
            Reference = "󰬲";
            Folder = "󰉋";
            Event = "󱐋";
            Operator = "󰪚";
            TypeParameter = "󰬛";
            Error = "󰏭";
            Warning = "󰏯";
            Information = "󰏮";
            Hint = "󰏭";

            Emoji = "🤶";
          };
        };
        completion = {
          ghost_text.enabled = true;
          menu = {
            border = "rounded";
            #winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None";
            draw = {
              gap = 1;
              treesitter = [ "lsp" ];
              columns = [
                {
                  __unkeyed-1 = "label";
                }
                {
                  __unkeyed-1 = "kind_icon";
                  __unkeyed-2 = "kind";
                  gap = 1;
                }
                { __unkeyed-1 = "source_name"; }
              ];
            };
          };
          trigger = {
            show_in_snippet = false;
          };
          documentation = {
            auto_show = true;
            window = {
              border = "rounded";
              #winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None";
            };
          };
          accept = {
            auto_brackets = {
              enabled = true;
            };
          };
        };
      };
    };
  };
}
