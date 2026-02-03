{
  pkgs,
  ...
}:
{
  extraPackages = with pkgs; [
    ripgrep
    fd
  ];
  plugins.web-devicons.enable = true;
  plugins.telescope = {
    enable = true;
    extensions = {
      file-browser = {
        enable = true;
        settings.hijack_netrw = true;
      };
      fzf-native = {
        enable = true;
      };
      undo = {
        enable = true;
      };
    };
    keymaps = {
      "<leader>f'" = {
        action = "marks";
        options.desc = "View marks";
      };
      "<leader>f/" = {
        action = "current_buffer_fuzzy_find";
        options.desc = "Fuzzy find in current buffer";
      };
      "<leader>f<CR>" = {
        action = "resume";
        options.desc = "Resume action";
      };
      "<leader>fa" = {
        action = "autocommands";
        options.desc = "View autocommands";
      };
      "<leader>fC" = {
        action = "commands";
        options.desc = "View commands";
      };
      "<leader>fb" = {
        action = "buffers";
        options.desc = "View buffers";
      };
      "<leader>fc" = {
        action = "grep_string";
        options.desc = "Grep string";
      };
      "<leader>ff" = {
        action = "file_browser";
        options.desc = "File browser";
      };
      "<leader><leader>" = {
        action = "find_files";
        options.desc = "Find files";
      };
      "<leader>fh" = {
        action = "help_tags";
        options.desc = "View help tags";
      };
      "<leader>fm" = {
        action = "man_pages";
        options.desc = "View man pages";
      };
      "<leader>fo" = {
        action = "oldfiles";
        options.desc = "View old files";
      };
      "<leader>fr" = {
        action = "registers";
        options.desc = "View registers";
      };
      "<leader>fs" = {
        action = "lsp_document_symbols";
        options.desc = "Search symbols";
      };
      "<leader>fq" = {
        action = "quickfix";
        options.desc = "Search quickfix";
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>fd";
      action.__raw = ''
        function()
          require("telescope.builtin").diagnostics({wrap_results=true, line_width='full'})
        end
      '';
      options.desc = "View diagnostics";
    }
    {
      mode = "n";
      key = "<leader>fF";
      action.__raw = ''
        function()
          require("telescope.builtin").find_files({ hidden = true, no_ignore = true})
        end
      '';
      options = {
        desc = "Find all files";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>f?";
      action.__raw = ''
        function()
          require("telescope.builtin").live_grep { grep_open_files=true }
        end
      '';
      options = {
        desc = "Find words in all open buffers";
        silent = true;
      };
    }
  ];
}
