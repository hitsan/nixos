{ config, pkgs, lib, user, ... }:
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
      ClientAliveCountMax 10
      ClientAliveInterval 300
    '';
  };
}