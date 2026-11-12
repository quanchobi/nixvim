{
  # Relies on opts.conceallevel = 2 from settings.nix.
  plugins.markview = {
    enable = true;
    settings = {
      preview = {
        hybrid_modes = [
          "n"
          "no"
        ];
        linewise_hybrid_mode = true;
      };
    };
  };
}
