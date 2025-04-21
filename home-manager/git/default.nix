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
  imports = [
    ./gh.nix
    ./lazygit
  ];
}
