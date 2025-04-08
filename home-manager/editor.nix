{ shell, ... }:
{
  programs = {
    neovim = {
      enable = true;
    };
  };
  programs.${shell}.shellAliases = {
    n = "nvim";
  };
}