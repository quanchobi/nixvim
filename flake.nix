{
  description = "Anderson's nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    treefmt-nix.url = "github:numtide/treefmt-nix"; # for gh actions
  };

  outputs =
    {
      self,
      nixpkgs,
      nixvim,
      treefmt-nix,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };

      treefmtEval = treefmt-nix.lib.evalModule pkgs (import ./fmt/treefmt.nix);

      # Shared by every output. `flakeSelf` lets modules reference this flake's source (used by nixd).
      nixvimModule = {
        imports = [ ./modules ];
        _module.args.flakeSelf = self;
      };
    in
    {
      # Standalone nixvim package
      packages.${system}.default = nixvim.legacyPackages.${system}.makeNixvimWithModule {
        inherit pkgs;
        module = nixvimModule;
      };

      # For use as a NixOS module
      nixosModules.default = {
        imports = [ nixvim.nixosModules.nixvim ];
        programs.nixvim = {
          nixpkgs.source = nixpkgs;
          enable = true;
          defaultEditor = true;
          viAlias = true;
          imports = [ nixvimModule ];
        };
      };

      # For use as a home-manager module
      homeModules.default = {
        imports = [ nixvim.homeModules.nixvim ];
        programs.nixvim = {
          nixpkgs.source = nixpkgs;
          enable = true;
          defaultEditor = true;
          viAlias = true;
          imports = [ nixvimModule ];
        };
      };

      formatter.${system} = treefmtEval.config.build.wrapper;

      checks.${system} = {
        formatting = treefmtEval.config.build.check self;
      };
    };
}
