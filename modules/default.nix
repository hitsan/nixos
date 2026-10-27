{ ... }:
{
  imports = [
    ./docker.nix
    ./nix-ld.nix
    ./discord.nix
    ./host.nix
    ./qemu.nix
    ./envfs.nix
  ];
}
