{ pkgs, ... }:
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
    lazydocker.enable = true;
  };
  home.packages = with pkgs; [
    just
  ];
}
