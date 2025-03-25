{ config, pkgs, ... }:
{
  services.ollama = {
    enable = true;
    loadModels = [ mistral:7b ];
  };
}