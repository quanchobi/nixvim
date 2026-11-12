{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    tree-sitter
    nodejs
  ];

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

  extraConfigLuaPost = ''
    vim.api.nvim_set_hl(0, 'LineNr', { fg = '#fdc253' })
    vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#fdc253' })
    for _, name in ipairs({ 'CursorLine', 'CursorLineSign', 'LineNrAbove', 'LineNrBelow', 'SignColumn' }) do
      vim.api.nvim_set_hl(0, name, {})
    end
  '';

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

    tabstop = 4;
    shiftwidth = 4;
    softtabstop = 4;
    expandtab = true;
  };
}
