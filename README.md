# Nixvim Config

My Neovim config using nixvim.

## Using as Standalone

### Run without Installing

To test this config on your system:

```sh
nix run 'github:quanchobi/nixvim'
```

### Direct Installation

Add the input to your flake:

```nix
{
    inputs = {
        nixvim.url = "github:quanchobi/nixvim";
    };
}
```

Add to system or home packages.

```nix
{ inputs, system, ... }:
{
  # NixOS
  environment.systemPackages = [ inputs.nixvim.packages.${pkgs.system}.default ];
  # Home Manager
  home.packages = [ inputs.nixvim.packages.${pkgs.system}.default ];
}
```

## Using as a Module

This assumes you are using a flake. If you are not, you should. They are quite nice. Modules for both NixOS and Home Manager are exposed.

### NixOS Module

To your `flake.nix`, add this repo as an input, and import it as a module

```nix
{
    inputs = {
        nixvim.url = "github:quanchobi/nixvim";
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    };
    outputs = {
        self,
        nixpkgs,
        ... }@inputs:
        {
          nixosConfigurations = {
            host = nixpkgs.lib.nixosSystem {
              modules = [ inputs.nixvim.nixosModules.default ];
            };
        };
    };
}
```

### Home Manager Module

To your `flake.nix`, add this repo as an input:

```nix
{
  config,
  lib,
  inputs,
  ...
}:

{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  options.system.gui.enable = lib.mkEnableOption "Enable GUI applications";

  config = {
    home-manager = {
      sharedModules = [
        inputs.nixvim.homeModules.default
      ]
    };
  };
}
```

## Plugins

<details>
<summary>Plugin List</summary>

| Plugin                                                                                        | Description                                                            |
| --------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs)                                    | Inserts or deletes brackets, parens, quotes in pair.                   |
| [guess-indent.nvim](https://github.com/nmac427/guess-indent.nvim)                             | Automatic indentation style detection (respects `.editorconfig`).      |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)               | Adds indentation guides to all lines.                                  |
| [otter.nvim](https://github.com/jmbuhr/otter.nvim)                                            | Provides LSP features for languages embedded in other documents.       |
| [rainbow-delimiters.nvim](https://gitlab.com/HiPhish/rainbow-delimiters.nvim)                 | Rainbow delimiters for nested brackets.                                |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)                         | Provides fast and accurate syntax highlighting.                        |
| [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context)         | Shows the enclosing scope at the top of the window.                    |
| [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects) | Function/class text objects.                                           |
| [undotree](https://github.com/mbbill/undotree)                                                | Visualizes undo history.                                               |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)                                   | Git signs, hunk staging and blame.                                     |
| [neogit](https://github.com/NeogitOrg/neogit)                                                 | Magit-style git interface.                                             |
| [conform.nvim](https://github.com/stevearc/conform.nvim)                                      | Formatting on save; formatters are installed automatically.            |
| [nvim-lint](https://github.com/mfussenegger/nvim-lint)                                        | Linters not covered by an LSP (statix, hadolint).                      |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)                                    | Language Server Protocol integration.                                  |
| [blink.cmp](https://github.com/Saghen/blink.cmp)                                              | Auto-completion, signature help and snippets (friendly-snippets).      |
| [base16.nvim](https://github.com/RRethy/base16.nvim)                                          | Base16 colorschemes.                                                   |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)                                  | A statusline for neovim.                                               |
| [mini.icons](https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-icons.md)        | Icons; also stands in for nvim-web-devicons.                           |
| [noice.nvim](https://github.com/folke/noice.nvim)                                             | A plugin that replaces the UI for messages, cmdline and the popupmenu. |
| [nvim-notify](https://github.com/rcarriga/nvim-notify)                                        | A notification manager for neovim.                                     |
| [startup.nvim](https://github.com/startup-nvim/startup.nvim)                                  | A startup screen for neovim.                                           |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)                            | A fuzzy finder for neovim (with file-browser and ui-select).           |
| [which-key.nvim](https://github.com/folke/which-key.nvim)                                     | A plugin that shows pending keybindings.                               |
| [markview.nvim](https://github.com/OXY2DEV/markview.nvim)                                     | Renders markdown in the buffer.                                        |

</details>

## Keybindings

### General

| Keybinding  | Description                                           |
| ----------- | ----------------------------------------------------- |
| `J`         | Keep cursor in same place when appending line using J |
| `<C-d>`     | Center cursor on screen when navigating with C-d      |
| `<C-u>`     | Center cursor on screen when navigating with C-u      |
| `n`         | Center cursor on screen when searching for text       |
| `N`         | Center cursor on screen when searching for text       |
| `<leader>y` | Copies selection into system clipboard                |
| `<leader>p` | Pastes from system clipboard                          |
| `<leader>s` | Replace selected word                                 |

### Text Objects

| Keybinding  | Description              |
| ----------- | ------------------------ |
| `af` / `if` | Around / inside function |
| `ac` / `ic` | Around / inside class    |

### Completion

| Keybinding          | Description                           |
| ------------------- | ------------------------------------- |
| `<Tab>` / `<S-Tab>` | Next / previous item or snippet field |
| `<CR>`              | Accept selected item                  |
| `<C-e>`             | Hide menu                             |
| `<C-space>`         | Show menu / toggle documentation      |
| `<C-s>`             | Toggle signature help                 |
| `<C-u>` / `<C-d>`   | Scroll documentation                  |

### UndoTree

| Keybinding   | Description     |
| ------------ | --------------- |
| `<leader>ut` | Toggle Undotree |

### Formatting

| Keybinding   | Description |
| ------------ | ----------- |
| `<leader>cf` | Format code |

### LSP (Language Server Protocol)

Neovim's built-in defaults (`grn`, `gra`, `grr`, `gri`, `gO`, `[d`, `]d`, `<C-w>d`) also apply.

| Keybinding   | Description         |
| ------------ | ------------------- |
| `gd`         | Goto Definition     |
| `gD`         | Goto References     |
| `gm`         | Goto Implementation |
| `gy`         | Type Definition     |
| `K`          | Hover               |
| `<leader>cr` | Rename              |
| `<leader>ca` | Code Action         |
| `<leader>cd` | Line Diagnostics    |

### Git

| Keybinding   | Description          |
| ------------ | -------------------- |
| `<leader>gg` | Open Neogit          |
| `]h` / `[h`  | Next / previous hunk |
| `<leader>hs` | Stage/unstage hunk   |
| `<leader>hr` | Reset hunk           |
| `<leader>hp` | Preview hunk         |
| `<leader>hb` | Blame line           |

### Telescope

| Keybinding         | Description                                |
| ------------------ | ------------------------------------------ |
| `<leader>f'`       | View marks                                 |
| `<leader>f/`       | Fuzzy find in current buffer               |
| `<leader>f<CR>`    | Resume action                              |
| `<leader>fa`       | View autocommands                          |
| `<leader>fC`       | View commands                              |
| `<leader>fb`       | View buffers                               |
| `<leader>fc`       | Grep string                                |
| `<leader>fd`       | View diagnostics                           |
| `<leader>fg`       | Live grep                                  |
| `<leader><leader>` | Find files                                 |
| `<leader>ff`       | File browser                               |
| `<leader>fh`       | View help tags                             |
| `<leader>fm`       | View man pages                             |
| `<leader>fo`       | View old files                             |
| `<leader>fr`       | View registers                             |
| `<leader>fs`       | Search symbols                             |
| `<leader>fq`       | Search quickfix                            |
| `<leader>gB`       | View git branches                          |
| `<leader>gC`       | View git commits                           |
| `<leader>gs`       | View git status                            |
| `<leader>gS`       | View git stashes                           |
| `<leader>fF`       | Find all files (including hidden)          |
| `<leader>fW`       | Find words in all files (including hidden) |
| `<leader>f?`       | Find words in all open buffers             |

## Credits

[nixvim](https://github.com/nix-community/nixvim)

[Elythh](https://github.com/elythh/nixvim) for their flake structure and the general idea
