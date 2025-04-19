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
  programs.${shell}.shellAliases = {
    l = "eza";
    ll = "eza -l";
    lt = "eza -T";
  };
}
