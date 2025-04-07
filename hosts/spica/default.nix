{ config, pkgs, lib, user, home, modules_path, ... }:
{
  imports = [
    ./configuration.nix
    ./networking.nix
    ./suspend.nix
    "${modules_path}/ollama.nix"
  ];
}