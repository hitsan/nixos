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
      AllowUsers = [ "hitsan" ];
      UseDns = true;
      X11Forwarding = true;
      PermitRootLogin = "prohibit-password";
    };
  };
}