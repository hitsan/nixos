{ config, pkgs, ... }: 
let
  env = import ../env.nix;
in
{
  home.username = env.name;
  home.homeDirectory = "/home/${env.name}";

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = env.name;
    userEmail = env.email;
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  home.stateVersion = "24.11";
}
