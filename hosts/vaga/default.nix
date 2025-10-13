{ modules_path, shellAliases, ... }:
{
  imports = [
    ./configuration.nix
    ./networking.nix
    ./suspend.nix
    modules_path
  ];
}

