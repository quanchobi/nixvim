{
  # Linters not already covered by an LSP (bashls runs shellcheck, ruff covers python).
  plugins.lint = {
    enable = true;
    autoInstall.enable = true;
    lintersByFt = {
      nix = [ "statix" ];
      dockerfile = [ "hadolint" ];
    };
    # Default is BufWritePost only, which leaves stale results after a file is
    # reloaded from disk (:e, or omp.nvim reloading an externally edited file).
    autoCmd.event = [
      "BufReadPost"
      "BufWritePost"
    ];
  };
}
