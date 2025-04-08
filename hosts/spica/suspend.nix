{ config, pkgs, ... }:
{
  services.logind.extraConfig = ''
    IdleAction=suspend
    IdleActionSec=10800
    HandleLidSwitch=ignore
    HandleLidSwitchExternalPower=ignore
    HandleLidSwitchDocked=ignore
    StopWhenSessionsEmpty=no
    IdleActionIgnoreInhibited=yes
    IdleActionIgnoreDocked=yes
    IdleActionIgnoreOnLid=yes
    IdleActionIgnoreOnExternalPower=yes
  '';
}