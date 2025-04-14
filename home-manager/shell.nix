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
      hflake = "home-manager --flake ~/dotfiles=hitsan";
      stop = "sudo systemctl suspend";
    };
    initExtra = ''
      PS1='%F{green}$%f '
      setopt no_beep
    '';

    dotDir = ".config/zsh";
  };
  programs = {
    fzf.enable = true;
    zoxide.enable = true;
  };
}
