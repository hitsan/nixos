{
  description = "My flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    spica.url = "path:./machines/spica";
  };

  outputs = { self, nixpkgs, spica }: {
    nixosConfigurations = {
      spica = spica.outputs.env;
    };
  };
}
