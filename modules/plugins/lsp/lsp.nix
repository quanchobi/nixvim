{
  pkgs,
  flakeSelf,
  ...
}:
let
  flake = ''(builtins.getFlake "${flakeSelf}")'';
in
{
  # Neovim >= 0.11 disables virtual_text by default; turn it back on.
  diagnostic.settings = {
    virtual_text = true;
    severity_sort = true;
    float.border = "rounded";
  };

  plugins = {
    lsp = {
      inlayHints = true;
      enable = true;
      servers = {
        nixd = {
          enable = true;
          settings = {
            nixpkgs.expr = "import ${flake}.inputs.nixpkgs { }";
            options.nixvim.expr = "${flake}.packages.${pkgs.stdenv.hostPlatform.system}.default.options";
          };
        };
        clangd.enable = true;
        html.enable = true;
        cssls.enable = true;
        jsonls.enable = true;
        yamlls.enable = true;
        bashls.enable = true;
        terraformls.enable = true;
        pyright.enable = true;
        ruff.enable = true;
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
          installRustfmt = true;
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
          "<leader>cr" = "rename";
          "<leader>ca" = "code_action";
        };
        diagnostic = {
          "<leader>cd" = "open_float";
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
