{ shell, ... }:
{
  programs.${shell} = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      switch = "sudo nixos-rebuild switch --flake ~/dotfiles#spica";
      home = "home-manager switch --flake ~/dotfiles#hitsan";
      hflake = "home-manager --flake ~/dotfiles=hitsan";
      down = "sudo shutdown -h 0";
      stop = "sudo systemctl suspend";
    };
    initExtra = ''
      PS1='%F{green}$%f '
      setopt no_beep
    '';

    dotDir = ".config/zsh";
  };
}
