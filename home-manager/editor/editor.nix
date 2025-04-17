{ shell, home_path, ... }:
let
  nvim_root = ./nvim;
in
{
  programs.neovim = {
    enable = true;
  };
  programs.${shell}.shellAliases = {
    v = "nvim";
  };
  home.file = {
    ".config/nvim/init.lua".source = "${nvim_root}/init.lua";
    ".config/nvim/lua/base.lua".source = "${nvim_root}/lua/base.lua";
#    ".config/nvim/plugin/init.lua".source = "${nvim_root}/plugin/init.lua";
#    ".config/nvim/plugin/gitsigns.lua".source = "${nvim_root}/plugin/gitsigns.lua";
  };
}

