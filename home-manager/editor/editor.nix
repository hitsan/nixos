{ shell, home_path, ... }:
{
  programs.neovim = {
    enable = true;
  };
  programs.${shell}.shellAliases = {
    v = "nvim";
  };
  home.file.".config/nvim" = {
    source = ./nvim;
    recursive = true;
  };
}

