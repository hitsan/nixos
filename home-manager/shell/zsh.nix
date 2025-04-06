{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      nix_switch = "sudo nixos-rebuild switch --flake ~/dotfiles#spica";
      home = "home-manager switch --flake ~/dotfiles/home-manager#hitsan";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };

    dotDir = ".config/zsh";
  };
}