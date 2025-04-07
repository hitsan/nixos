{ config, pkgs, ... }:
{
  services.logind.extraConfig = ''
    IdleAction=suspend
    IdleActionSec=10800
  '';
}