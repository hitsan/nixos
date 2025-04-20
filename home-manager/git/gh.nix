{ shell, user, ... }:
{
  programs = {
    gh = {
      enable = true;
      gitCredentialHelper.enable = true;
      settings = {
        git_protocol = "ssh";
      };
    };
    gh-dash.enable = true;
  };
}
