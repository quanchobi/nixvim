{ pkgs, lib, ... }:
{
  plugins = {
    treesitter = {
      enable = true;
      settings = {
        indent.enable = false; # Seems to be broken unless I'm dumb? Never indents correctly.
        highlight = {
          enable = true;
          additional_vim_regex_highlighting = false;
        };
      };
      folding.enable = false;
      nixvimInjections = true;
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        bash
        lua
        make
        python
        go

        c
        cpp
        rust

        sql
        javascript
        typescript
        tsx
        html
        css
        json
        dockerfile
        hcl
        terraform

        latex
        markdown
        markdown-inline
        regex
        vimdoc
        vim
        query

        diff
        gitcommit

        nix
        xml
        yaml
        toml
      ];
    };

    treesitter-context = {
      enable = true;
    };

    # Upstream no longer reads keymaps from setup(); they are mapped below.
    treesitter-textobjects = {
      enable = true;
      settings.select.lookahead = true;
    };
  };

  keymaps =
    lib.mapAttrsToList
      (key: query: {
        mode = [
          "x"
          "o"
        ];
        inherit key;
        action.__raw = ''
          function()
            require("nvim-treesitter-textobjects.select").select_textobject("${query}", "textobjects")
          end
        '';
        options.desc = "Select ${query}";
      })
      {
        "af" = "@function.outer";
        "if" = "@function.inner";
        "ac" = "@class.outer";
        "ic" = "@class.inner";
      };
}
