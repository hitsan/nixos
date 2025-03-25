{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-ld.url = "github:Mic92/nix-ld";
    # this line assume that you also have nixpkgs as an input
    nix-ld.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nix-ld, nixpkgs, ... }@inputs: {
    nixosConfigurations.spica = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        ./network.nix
        ./systemd.nix
        ./ollama.nix
        nix-ld.nixosModules.nix-ld

        { programs.nix-ld.dev.enable = true; }
      ];
    };
  };
}
