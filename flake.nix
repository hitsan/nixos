{
  description = "My flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nix-ld = {
      url = "github:Mic92/nix-ld";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nix-ld }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    nixosConfigurations = {
      spica = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/spica/configuration.nix
          ./hosts/spica/networking.nix
          ./hosts/spica/systemd.nix
          nix-ld.nixosModules.nix-ld
          { programs.nix-ld.dev.enable = true; }
          ./modules/ollama.nix
        ];
      };
    };

    homeConfigurations."hitsan" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [
        ./home-manager/home.nix
        ./shell/zsh.nix
      ];
    };
  };
}
