{
  autoCmd = [
    {
      desc = "Vertically center document when entering insert mode";
      event = "InsertEnter";
      command = "norm zz";
    }
    {
      desc = "Open help in horizontal split";
      event = "FileType";
      pattern = "help";
      command = "wincmd H";
    }


    # File specific commands
    {
      desc = "Set nix filetype indent";
      event = [ "FileType" ];
      pattern = "nix";
      command = "setlocal shiftwidth=2 tabstop=2";
    }

    {
      desc = "Set wrap for markdown files";
      event = [ "FileType" ];
      pattern = "md";
      command = "setlocal wrap";
    }

    {
      desc = "Enable Otter for markdown files";
      event = [ "FileType" ];
      pattern = "md";
      command = "lua require'otter'.activate()";
    }
  ];
}
