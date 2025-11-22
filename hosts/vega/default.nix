{ modules_path, ... }:
{
  imports = [
    ./configuration.nix
    ./networking.nix
    ./suspend.nix
    "${modules_path}/nix-ld.nix"
  ];
}

