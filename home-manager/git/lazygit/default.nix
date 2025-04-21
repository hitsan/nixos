{ shell, home_path, ... }:
{
  programs.lazygit = {
    enable = true;
  };
  programs.${shell}.shellAliases = {
    laz = "lazygit";
  };
  home.file.".config/lazygit/config.yml" = {
    source = "${home_path}/git/lazygit/config.yml";
  };
}
