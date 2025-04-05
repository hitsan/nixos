{
  description = "My flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nix-ld = {
      url = "github:Mic92/nix-ld";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nix-ld }: {
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
  };
}
