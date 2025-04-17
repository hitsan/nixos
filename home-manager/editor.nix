{ shell, home_path, ... }:
{
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      lazy-nvim
    ];
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
  home.file.".config/nvim/lua/plugins/init.lua" = home_path + "/editor/nvim/plugins/init.lua";
  home.file.".config/nvim/lua/plugins/gitsings.lua" = home_path + "/editor/nvim/plugins/gitsings.lua";
}

