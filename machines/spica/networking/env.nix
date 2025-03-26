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
}