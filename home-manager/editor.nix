{ shell, ... }:
{
  programs.neovim = {
    enable = true;
    extraConfig = ''
      set number
      set cursorline
      set virtualedit=onemore
      set expandtab
      set tabstop=2
      set showmatch
      set shiftwidth=2
    '';
  };
  programs.${shell}.shellAliases = {
    v = "nvim";
  };
}

