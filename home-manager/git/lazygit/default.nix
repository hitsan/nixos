{ shell, home_path, ... }:
{
  programs.lazygit = {
    enable = true;
  };
  programs.${shell}.shellAliases = {
    lazg = "lazygit";
  };
  home.file.".config/lazygit/config.yml" = {
    source = "${home_path}/git/lazygit/config.yml";
  };
}
