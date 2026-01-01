{
  plugins.guess-indent = {
    enable = true;
    settings = {
      auto_cmd = true;
      buftype_exclude = [
        #"help"
        #"nofile"
        #"terminal"
        #"prompt"
      ];
      filetype_exclude = [
        #"netrw"
        #"tutor"
      ];
      on_space_options = {
        expandtab = true;
        shiftwidth = "detected";
        softtabstop = "detected";
        tabstop = "detected";
      };
      on_tab_options = {
        expandtab = true;
      };
      override_editorconfig = true;
    };
  };
}
