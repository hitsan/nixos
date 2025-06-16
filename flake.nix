{
  description = "My NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nix-ld = {
      url = "github:Mic92/nix-ld";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    xremap.url = "github:xremap/nix-flake";
  };

  outputs = { self, nixpkgs, home-manager, nix-ld, xremap }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    user = "hitsan";
    root = builtins.toString ./.;
    modules_path = "${root}/modules";
    hosts_path = "${root}/hosts";
    shell = "zsh";
  in
  {
    nixosConfigurations = {
      spica = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit user nix-ld modules_path xremap;
        };

        modules = [ ./hosts/spica ];
      };
    };
  };
}
