{ modules_path, ... }:
{
  imports = [
    ./configuration.nix
    ./networking.nix
    ./suspend.nix
    modules_path
#    "${modules_path}/docker.nix"
#    "${modules_path}/ollama.nix"
#    "${modules_path}/nix-ld.nix"
#    "${modules_path}/discord.nix"
  ];
}

