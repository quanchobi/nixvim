{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimPlugins; [
    friendly-snippets
    luasnip
    cmp-nvim-lsp
    cmp-path
    cmp-nvim-lsp-signature-help
    blink-compat
  ];

  plugins = {
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
          preset = "none";
          "<Tab>" = [
            "snippet_forward"
            "select_next"
            "fallback"
          ];
          "<S-Tab>" = [
            "snippet_backward"
            "select_prev"
            "fallback"
          ];
          "<CR>" = [
            "accept"
            "fallback"
          ];

          "<C-space>" = [
            "show"
            "show_documentation"
            "hide_documentation"
            "fallback"
          ];
          "<C-s>" = [
            "show_signature"
            "hide_signature"
            "fallback"
          ];

          "<C-u>" = [
            "scroll_documentation_up"
            "fallback"
          ];
          "<C-d>" = [
            "scroll_documentation_down"
            "fallback"
          ];
        };

        signature = {
          enabled = true;
        };

        sources = {
          default = [
            "lsp"
            "buffer"
            "snippets"
            "treesitter"
            "path"
            "ripgrep"
          ];

          providers = {
            lsp = {
              name = "LSP";
              module = "blink.cmp.sources.lsp";
              score_offset = 10;
            };
            snippets = {
              name = "Snippets";
              module = "blink.cmp.sources.snippets";
              score_offset = 8;
            };
            treesitter = {
              name = "treesitter";
              module = "blink.compat.source";
              score_offset = 6;
            };
            buffer = {
              name = "Buffer";
              module = "blink.cmp.sources.buffer";
              score_offset = 4;
            };
            path = {
              name = "Path";
              module = "blink.cmp.sources.path";
              score_offset = 2;
            };
            ripgrep = {
              name = "Ripgrep";
              module = "blink-ripgrep";
              score_offset = 0;
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
