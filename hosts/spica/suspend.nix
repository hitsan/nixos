{ ... }:
{
  services.logind.settings.Login = {
    IdleAction = "ignore";
    IdleActionSec = 0;
    HandleLidSwitch = "ignore";
    HandleLidSwitchExternalPower = "ignore";
    HandleLidSwitchDocked = "ignore";
    StopWhenSessionsEmpty = false;
    IdleActionIgnoreInhibited = true;
    IdleActionIgnoreDocked = true;
    IdleActionIgnoreOnLid = true;
    IdleActionIgnoreOnExternalPower = true;
  };
  systemd.sleep.extraConfig = ''
    AllowSuspend=no
    AllowHibernation=no
    AllowHybridSleep=no
    AllowSuspendThenHibernate=no
  '';
}
