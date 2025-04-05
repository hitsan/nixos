{
  description = "My flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    spica.url = "path:./hosts/spica";
  };

  outputs = { self, nixpkgs, spica }: {
    nixosConfigurations = {
      spica = spica.outputs.env;
    };
  };
}
