{ config, pkgs, shell, ... }:
{
  home.packages = [
    pkgs.zellij
  ];

  programs.zellij = {
    enableZshIntegration = true;
    settings = {
      "zellij.default" = {
        "theme" = "dark";
        "layout" = "default";
      };
    };
  };
  programs.${shell} = {
    shellAliases = {
      z = "zellij";
      zls = "zellij ls";
      zka = "zellij ka -y";
      zda = "zellij da -y";
    };
    initExtra = ''
      function precmd() {
        print -Pn "\e]2;%~\a"
      }
    '';
  };
}
