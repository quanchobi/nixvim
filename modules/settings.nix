{ pkgs, ... }:
{
  performance = {
    byteCompileLua = {
      enable = true;
      nvimRuntime = true;
      configs = true;
      plugins = true;
    };
  };

  clipboard = {
    providers = {
      wl-copy = {
        enable = true;
        package = pkgs.wl-clipboard;
      };
    };
  };

  opts = {
    mouse = "";
    number = true;
    relativenumber = true;
    cursorline = true;
    cursorlineopt = "number";

    wrap = false;
    sidescroll = 2;
    sidescrolloff = 2;
    scrolloff = 8;

    hlsearch = true;
    ignorecase = true;
    smartcase = true;
    incsearch = true;
    showmatch = true;

    swapfile = false;
    backup = false;
    undofile = true;

    termguicolors = true;
    signcolumn = "yes";
    showmode = false;
    conceallevel = 2;
  };
}
