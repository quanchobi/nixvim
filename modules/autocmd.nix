{
  autoCmd = [
    {
      desc = "Vertically center document when entering insert mode";
      event = "InsertEnter";
      command = "norm zz";
    }
    {
      desc = "Open help in a vertical split on the left";
      event = "FileType";
      pattern = "help";
      command = "wincmd H";
    }
    {
      desc = "Briefly highlight yanked text";
      event = "TextYankPost";
      callback.__raw = "function() vim.hl.on_yank() end";
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
      pattern = "markdown";
      command = "setlocal wrap";
    }

    {
      desc = "Enable Otter for markdown files";
      event = [ "FileType" ];
      pattern = "markdown";
      command = "lua require'otter'.activate()";
    }

  ];
}
