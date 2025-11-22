{ ... }:
{
  services.logind.extraConfig = ''
    IdleAction=ignore
    IdleActionSec=0
    HandleLidSwitch=ignore
    HandleLidSwitchExternalPower=ignore
    HandleLidSwitchDocked=ignore
    StopWhenSessionsEmpty=no
    IdleActionIgnoreInhibited=yes
    IdleActionIgnoreDocked=yes
    IdleActionIgnoreOnLid=yes
    IdleActionIgnoreOnExternalPower=yes
  '';
  systemd.sleep.extraConfig = ''
    AllowSuspend=no
    AllowHibernation=no
    AllowHybridSleep=no
    AllowSuspendThenHibernate=no
  '';
}
