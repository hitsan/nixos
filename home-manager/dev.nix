{ ... }:
{
  programs = {
    direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };
    git = {
      enable = true;
      userName = user;
      userEmail = "soledewa2828@gmail.com";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
    keychain = {
        enable = true;
        agents = [ "ssh" ];
        keys = [ "id_ed25519" ];
    };
  };
}