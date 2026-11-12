{
  plugins.noice = {
    enable = true;
    settings = {
      lsp = {
        override = {
          "vim.lsp.util.convert_input_to_markdown_lines" = true;
          "vim.lsp.util.stylize_markdown" = true;
        };
        # blink.cmp shows signature help; noice's popup would duplicate it.
        signature.enabled = false;
      };
      routes = [
        {
          filter = {
            event = "msg_show";
            kind = "";
          };
          view = "notify";
        }
        {
          filter = {
            event = "lsp";
            kind = "progress";
          };
          view = "mini";
        }
      ];
      presets = {
        command_palette = true;
        lsp_doc_border = true;
      };
    };
  };
}
