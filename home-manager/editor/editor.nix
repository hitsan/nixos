{ shell, home_path, ... }:
let
  nvim_root = ./nvim;
  nvim_config = ".config/nvim";
  lua_config = "${nvim_config}/lua";
  plugins_config = "${lua_config}/plugins";
in
{
  programs.neovim = {
    enable = true;
  };
  programs.${shell}.shellAliases = {
    v = "nvim";
  };
  home.file = {
    "${nvim_config}/init.lua".source = "${nvim_root}/init.lua";
    "${lua_config}/base.lua".source = "${nvim_root}/lua/base.lua";
    "${plugins_config}/init.lua".source = "${nvim_root}/lua/plugins/init.lua";
    "${plugins_config}/gitsigns.lua".source = "${nvim_root}/lua/plugins/gitsigns.lua";
  };
}

