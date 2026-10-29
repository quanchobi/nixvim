{
  plugins.undotree = {
    enable = true;
    settings = {
      DiffAutoOpen = true;
      SetFocusWhenToggle = true;
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>ut";
      action = "<cmd>UndotreeToggle<CR>";
      options = {
        silent = true;
        desc = "Toggle Undotree";
      };
    }
  ];
}
