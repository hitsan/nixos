{ config, pkgs, lib, user, home, shell, ... }:
{
  home.username = user;
  home.homeDirectory = home;
  home.stateVersion = "24.05";

  home.packages = [ ];

  home.file = { };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = user;
    userEmail = "soledewa2828@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
  programs = {
    direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };
  };
  programs.keychain = {
    enable = true;
    agents = [ "ssh" ];
    keys = [ "id_ed25519" ];
  };
  imports = [
    ../shell/${shell}.nix
    ./zellij.nix
    ./editor.nix
  ];
}
