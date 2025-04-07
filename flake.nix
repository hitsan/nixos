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
    user = "hitsan";
    home = "/home/${user}";
    root = builtins.toString ./.;
    modules_path = "${root}/modules";
    hosts_path = "${root}/hosts";
  in
  {
    nixosConfigurations = {
      spica = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit user home nix-ld modules_path;
        };

        modules = [ ./hosts/spica ];
      };
    };

    homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = { inherit user home; };

      modules = [ ./home-manager/home.nix ];
    };
  };
}
