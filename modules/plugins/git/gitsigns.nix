{
  plugins.gitsigns.enable = true;

  keymaps = [
    {
      mode = "n";
      key = "]h";
      action = "<cmd>Gitsigns nav_hunk next<CR>";
      options.desc = "Next git hunk";
    }
    {
      mode = "n";
      key = "[h";
      action = "<cmd>Gitsigns nav_hunk prev<CR>";
      options.desc = "Previous git hunk";
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>hs";
      action = ":Gitsigns stage_hunk<CR>";
      options = {
        silent = true;
        desc = "Stage/unstage hunk";
      };
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>hr";
      action = ":Gitsigns reset_hunk<CR>";
      options = {
        silent = true;
        desc = "Reset hunk";
      };
    }
    {
      mode = "n";
      key = "<leader>hp";
      action = "<cmd>Gitsigns preview_hunk<CR>";
      options.desc = "Preview hunk";
    }
    {
      mode = "n";
      key = "<leader>hb";
      action = "<cmd>Gitsigns blame_line<CR>";
      options.desc = "Blame line";
    }
  ];
}
