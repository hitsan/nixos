{ config, pkgs, shell, ... }:
{
  home.packages = [
    pkgs.zellij
  ];

  programs.zellij = {
    enableZshIntegration = true;
  };
  programs.${shell}.shellAliases = {
    z = "zellij";
    zka = "zellij ka -y";
    zda = "zellij da -y";
  };
}
