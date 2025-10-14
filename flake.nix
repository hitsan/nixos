{
  description = "My NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nix-ld = {
      url = "github:Mic92/nix-ld";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    xremap.url = "github:xremap/nix-flake";
  };

  outputs = { self, nixos-hardware, nixpkgs, nix-ld, xremap }:
  let
    user = "hitsan";
    root = builtins.toString ./.;
    modules_path = "${root}/modules";
    shell = "zsh";
    
    commonAliases = hostname: {
      ll = "ls -la";
      grep = "grep --color=auto";
      "switch ${hostname}" = "sudo nixos-rebuild switch --flake ~/nixos#${hostname}";
    };
  in
  {
    nixosConfigurations = {
      spica = nixpkgs.lib.nixosSystem {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
        specialArgs = {
          inherit user nix-ld modules_path xremap;
          shellAliases = commonAliases "spica";
        };

        modules = [ ./hosts/spica ];
      };

      vaga = nixpkgs.lib.nixosSystem {
        pkgs = import nixpkgs {
          system = "aarch64-linux";
          config.allowUnfree = true;
        };
        specialArgs = {
          inherit user nix-ld modules_path xremap;
          shellAliases = commonAliases "vaga";
        };

        modules = [ ./hosts/vaga
            nixos-hardware.nixosModules.raspberry-pi-4
            "${nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64.nix"
          ];
      };
    };
  };
}
