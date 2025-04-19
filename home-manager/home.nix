{ config, pkgs, lib, user, home, shell, home_path, ... }:
{
  home.username = user;
  home.homeDirectory = home;
  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    bat
    eza
  ];
  home.file = { };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  imports = [
    ./shell.nix
    ./zellij
    ./editor/editor.nix
    ./dev
  ];
}
