{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-ld.url = "github:Mic92/nix-ld";
    nix-ld.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nix-ld, ... }@inputs: {
    env = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        ./networking.nix
        ./systemd.nix
        nix-ld.nixosModules.nix-ld
        { programs.nix-ld.dev.enable = true; }
        ./ollama.nix
      ];
    };
  };
}
