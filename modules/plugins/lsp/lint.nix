{
  # Linters not already covered by an LSP (bashls runs shellcheck, ruff covers python).
  plugins.lint = {
    enable = true;
    autoInstall.enable = true;
    lintersByFt = {
      nix = [ "statix" ];
      dockerfile = [ "hadolint" ];
    };
  };
}
