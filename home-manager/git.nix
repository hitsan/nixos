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
    lazygit = {
      enable = true;
    };
    gh = {
      enable = true;
      gitCredentialHelper.enable = true;
      settings = {
        git_protocol = "ssh";
      };
    };
    gh-dash.enable = true;
  };
  programs.${shell}.shellAliases = {
    laz = "lazygit";
    dash = "gh dash";
  };
}
