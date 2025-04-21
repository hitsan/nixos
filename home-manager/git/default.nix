{ shell, user, ... }:
{
  programs = {
    git = {
      enable = true;
      userName = user;
      userEmail = "soledewa2828@gmail.com";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };
  programs.${shell}.shellAliases = {
    dash = "gh dash";
  };
  imports = [
    ./gh.nix
    ./lazygit
  ];
}
