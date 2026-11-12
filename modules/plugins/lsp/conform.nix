let
  prettier = {
    __unkeyed-1 = "prettierd";
    __unkeyed-2 = "prettier";
    stop_after_first = true;
  };
in
{
  plugins.conform-nvim = {
    enable = true;
    # Installs every formatter referenced in formatters_by_ft from nixpkgs.
    autoInstall.enable = true;
    settings = {
      format_on_save = {
        lsp_format = "fallback";
        timeout_ms = 500;
      };
      notify_on_error = true;
      formatters_by_ft = {
        bash = [ "shfmt" ];
        sh = [ "shfmt" ];
        css = prettier;
        html = prettier;
        javascript = prettier;
        javascriptreact = prettier;
        lua = [ "stylua" ];
        markdown = prettier;
        nix = [ "nixfmt" ];
        python = [ "black" ];
        typescript = prettier;
        typescriptreact = prettier;
        yaml = [ "yamlfmt" ];
        hcl = [ "hclfmt" ];
      };
      formatters = {
        black = {
          prepend_args = [ "--fast" ];
        };
        prettier = {
          prepend_args = [ "--no-semi" ];
        };
      };
    };
  };
  keymaps = [
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>cf";
      action = "<cmd>lua require('conform').format()<cr>";
      options = {
        silent = true;
        desc = "Format";
      };
    }
  ];
}
