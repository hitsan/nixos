{ shell, ... }:
{
  programs.lazygit = {
    enable = true;
  };
  programs.${shell}.shellAliases = {
    laz = "lazygit";
  };
}
