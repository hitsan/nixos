{ shell, user, ... }:
{
  programs = {
    direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };
    keychain = {
        enable = true;
        agents = [ "ssh" ];
        keys = [ "id_ed25519" ];
    };
  };
  imports = [
    ./git.nix
  ];
}
