{
  description = "My NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
    nix-ld = {
      url = "github:Mic92/nix-ld";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    xremap.url = "github:xremap/nix-flake";
  };

  outputs = { self, nixpkgs, nix-ld, xremap }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    user = "hitsan";
    root = builtins.toString ./.;
    modules_path = "${root}/modules";
    shell = "zsh";
    
    # 共通エイリアスの定義
    commonAliases = hostname: {
      ll = "ls -la";
      grep = "grep --color=auto";
      "switch ${hostname}" = "sudo nixos-rebuild switch --flake ~/nixos#${hostname}";
    };
  in
  {
    nixosConfigurations = {
      spica = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit user nix-ld modules_path xremap;
          shellAliases = commonAliases "spica";
        };

        modules = [ ./hosts/spica ];
      };
      vaga = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit user nix-ld modules_path xremap;
          shellAliases = commonAliases "vaga";
        };

        modules = [ ./hosts/vaga ];
      };
    };
  };
}
