{
  description = "Anderson's nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixvim,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      # Standalone nixvim package
      packages.${system}.default = nixvim.legacyPackages.${system}.makeNixvimWithModule {
        inherit pkgs;
        module = {
          imports = [ ./modules ];
          extraPackages = with pkgs; [
            tree-sitter
            nodejs
            fd
          ];
        };
      };

      # For use as a NixOS module
      nixosModules.default = {
        imports = [ nixvim.nixosModules.nixvim ];
        programs.nixvim = {
          enable = true;
          defaultEditor = true;
          viAlias = true;
          imports = [ ./modules ];
          extraPackages = with pkgs; [
            tree-sitter
            nodejs
            fd
          ];
        };
      };

      # For use as a home-manager module
      homeManagerModules.default = {
        imports = [ nixvim.homeManagerModules.nixvim ];
        programs.nixvim = {
          enable = true;
          defaultEditor = true;
          viAlias = true;
          imports = [ ./modules ];
          extraPackages = with pkgs; [
            tree-sitter
            nodejs
            fd
          ];
        };
      };
    };
}
