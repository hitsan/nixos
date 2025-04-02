{
  services.ollama = {
    enable = true;
    openFirewall = true;
    loadModels = [
      gemma3:1b
      deepseek-r1:7b
      mistral:7b
    ];
  };
}