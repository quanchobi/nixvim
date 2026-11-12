{
  plugins = {
    cmp-nvim-lsp.enable = true;
    fidget.enable = true;
    lsp = {
      inlayHints = true;
      enable = true;
      servers = {
        nixd.enable = true;
        clangd.enable = true;
        html.enable = true;
        pyright.enable = true;
        markdown_oxide.enable = true;
        # ltex-ls was archived upstream and removed from nixpkgs; ltex-ls-plus is the maintained fork.
        ltex_plus = {
          enable = true;
          # ltex re-checks the whole document with LanguageTool on every didChange, which
          # pins the JVM at >100% CPU while typing prose. Check on save instead.
          settings.ltex.checkFrequency = "save";
        };
        #textlsp.enable = true;
        rust_analyzer = {
          enable = true;
          installCargo = true;
          installRustc = false;
        };
        ts_ls.enable = true;
        lua_ls.enable = true;
        gopls.enable = true;
      };
      keymaps = {
        lspBuf = {
          K = "hover";
          gD = "references";
          gm = "implementation";
          gy = "type_definition";
        };
        extra = [
          {
            action = {
              __raw = "require('telescope.builtin').lsp_definitions";
            };
            key = "gd";
            options.desc = "Go to definition";
          }
        ];
      };
    };
  };
}
