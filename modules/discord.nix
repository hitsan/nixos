{ pkgs, user, ... }:
{
  users.users.${user}.packages = with pkgs; [
    discord-ptb
  ];
}
