{ user }:
{ config, pkgs, ... }:
{
  networking = {
    networkmanager.enable = true;
    interfaces.eno1 = {
      wakeOnLan.enable = true;
    };
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 ];
    };
  };
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = false;
      AllowUsers = [ user ];
      UseDns = true;
      X11Forwarding = true;
      PermitRootLogin = "prohibit-password";
    };
    extraConfig = ''
      ClientAliveCountMax 3
      ClientAliveInterval 180
    '';
  };
}