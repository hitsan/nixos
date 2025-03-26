{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-ld.url = "github:Mic92/nix-ld";
    nix-ld.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nix-ld, nixpkgs, ... }@inputs: {
    env = nixpkgs.lib.nixosSystem {
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
