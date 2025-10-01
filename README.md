# Nixvim Config
---

My Neovim config using nixvim.

## Using as Standalone
---

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
---

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
---

_todo..._

## Credits
---

[nixvim](https://github.com/nix-community/nixvim)
[Elythh](https://github.com/elythh/nixvim) for their flake structure and the general idea
