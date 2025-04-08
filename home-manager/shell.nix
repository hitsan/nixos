{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      switch = "sudo nixos-rebuild switch --flake ~/dotfiles#spica";
      home = "home-manager switch --flake ~/dotfiles#hitsan";
      stop = "sudo systemctl suspend";
    };

    dotDir = ".config/zsh";
  };
}