{
  opts.conceallevel = 2; # necessary for obsidian

  plugins = {
    markview = {
      enable = true;
      settings = {
        preview.hybrid_modes = [
          "n"
          "no"
        ];
        linewise_hybrid_mode = true;
      };
    };
  };
}
