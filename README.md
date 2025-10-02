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
        inputs.nixvim.homeManagerModules.default
      ]
    };
  };
}
```

## Plugins

<details>
<summary>Plugin List</summary>

| Plugin | Description |
|---|---|
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Inserts or deletes brackets, parens, quotes in pair. |
| [comment.nvim](https://github.com/numToStr/Comment.nvim) | Smart commenting. |
| [guess-indent.nvim](https://github.com/nmac427/guess-indent.nvim) | Automatic indentation style detection. |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Adds indentation guides to all lines. |
| [otter.nvim](https://github.com/jmbuhr/otter.nvim) | Provides LSP features for languages embedded in other documents. |
| [nvim-treesitter-rainbow](https://gitlab.com/HiPhish/nvim-treesitter-rainbow) | Rainbow delimiters for nested brackets. |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Provides fast and accurate syntax highlighting. |
| [undotree](https://github.com/mbbill/undotree) | Visualizes undo history. |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git integration for neovim. |
| [conform.nvim](httpss://github.com/stevearc/conform.nvim) | A plugin for formatting code. |
| [nvim-lint](https://github.com/mfussenegger/nvim-lint) | A linter plugin. |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | Language Server Protocol integration. |
| [lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim) | An enhancement for the built-in LSP. |
| [base16.nvim](https://github.com/RRethy/base16.nvim) | Base16 colorschemes. |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | A statusline for neovim. |
| [mini.icons](https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-icons.md) | A small set of icons for neovim. |
| [noice.nvim](https://github.com/folke/noice.nvim) | A plugin that replaces the UI for messages, cmdline and the popupmenu. |
| [nvim-notify](https://github.com/rcarriga/nvim-notify) | A notification manager for neovim. |
| [startup.nvim](https://github.com/startup-nvim/startup.nvim) | A startup screen for neovim. |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | A fuzzy finder for neovim. |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | A plugin that shows pending keybindings. |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Auto-completion plugin. |
| [nvim-dap](https://github.com/mfussenegger/nvim-dap) | Debug Adapter Protocol implementation for debugging. |
| [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) | UI for nvim-dap. |
| [obsidian.nvim](https://github.com/epwalsh/obsidian.nvim) | For working with obsidian vaults. |
| [ollama.nvim](https://github.com/nomnivore/ollama.nvim) | Ollama integration for code generation. |

</details>

## Keybindings

### General

| Keybinding | Description |
|---|---|
| `J` | Keep cursor in same place when appending line using J |
| `<C-d>` | Center cursor on screen when navigating with C-d |
| `<C-u>` | Center cursor on screen when navigating with C-u |
| `n` | Center cursor on screen when searching for text |
| `N` | Center cursor on screen when searching for text |
| `<leader>y` | Copies selection into system clipboard |
| `<leader>p` | Pastes from system clipboard |
| `<leader>s` | Replace selected word |

### Debugging

The Debug Adapter Protocol (DAP) is configured to automatically open and close its UI when a debug session is started, terminated, or exited.

| Keybinding | Description |
|---|---|
| `<F5>` | Start debugging |
| `<F6>` | Stop debugging |
| `<F7>` | Toggle breakpoint |
| `<F8>` | Continue |
| `<F9>` | Step over |
| `<F10>` | Step into |
| `<F11>` | Step out |

### Ollama

| Keybinding | Description |
|---|---|
| `<leader>oo` | Ollama prompt |
| `<leader>oG` | Ollama Generate Code |

### UndoTree

| Keybinding | Description |
|---|---|
| `<leader>ut` | Toggle Undotree |

### Formatting

| Keybinding | Description |
|---|---|
| `<leader>cf` | Format code |

### LSP (Language Server Protocol)

| Keybinding | Description |
|---|---|
| `gd` | Goto Definition |
| `gr` | Goto References |
| `gI` | Goto Implementation |
| `gT` | Type Definition |
| `K` | Hover |
| `<leader>cw` | Outline |
| `<leader>cr` | Rename |
| `<leader>ca` | Code Action |
| `<leader>cd` | Line Diagnostics |
| `[d` | Next Diagnostic |
| `]d` | Previous Diagnostic |

### Telescope

| Keybinding | Description |
|---|---|
| `<leader>f'` | View marks |
| `<leader>f/` | Fuzzy find in current buffer |
| `<leader>f<CR>` | Resume action |
| `<leader>fa` | View autocommands |
| `<leader>fC` | View commands |
| `<leader>fb` | View buffers |
| `<leader>fc` | Grep string |
| `<leader>fd` | View diagnostics |
| `<leader>ff` or `<leader><leader>` | Find files |
| `<leader>fh` | View help tags |
| `<leader>fm` | View man pages |
| `<leader>fo` | View old files |
| `<leader>fr` | View registers |
| `<leader>fs` | Search symbols |
| `<leader>fq` | Search quickfix |
| `<leader>gB` | View git branches |
| `<leader>gC` | View git commits |
| `<leader>gs` | View git status |
| `<leader>gS` | View git stashes |
| `<leader>fF` | Find all files (including hidden) |
| `<leader>fW` | Find words in all files (including hidden) |
| `<leader>f?` | Find words in all open buffers |


## Credits

[nixvim](https://github.com/nix-community/nixvim)

[Elythh](https://github.com/elythh/nixvim) for their flake structure and the general idea
