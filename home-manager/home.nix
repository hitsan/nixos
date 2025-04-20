{ config, pkgs, lib, user, home, shell, home_path, ... }:
{
  home.username = user;
  home.homeDirectory = home;
  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    bat
    eza
    jq
  ];
  home.file = { };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs = {
    fzf.enable = true;
    zoxide.enable = true;
  };
  programs.${shell}.shellAliases = {
    l = "eza";
    ll = "eza -l";
    lt = "eza -T";
  };
  imports = [
    ./shell.nix
    ./zellij
    ./editor/editor.nix
    ./git
    ./dev
  ];
}
