{ config, pkgs, shell, ... }:
{
  home.packages = [
    pkgs.zellij
  ];

  programs.zellij = {
    enableZshIntegration = true;
    settings = {
      "zellij.default" = {
        "theme" = "dark";
        "layout" = "default";
      };
    };
    # configFile = pkgs.writeText "zellij-config" ''
    #   # ここにZellijの設定を追加
    #   status-bar {
    #     enabled = true
    #     items = [
    #       { type = "current_directory" }
    #       { type = "git_branch" }
    #       { type = "virtualenv" }
    #       { type = "nix_shell" }
    #     ]
    #   }
    # '';
  };

  home.file.".config/zellij/config.kdl".source = ./config.kdl;
  home.file.".config/zellij/layouts/pane_title.kdl".source = ./pane_title.kdl;
  # home.file = {
  #   ".config/zellij/config.kdl" = pkgs.writeText "zellij-config" ''
  #     # ここにZellijの設定を追加
  #     status-bar {
  #       enabled = true
  #       items = [
  #         { type = "current_directory" }
  #         { type = "git_branch" }
  #         { type = "virtualenv" }
  #         { type = "nix_shell" }
  #       ]
  #     }

  #     pane {
  #       title = "{current_directory} {git_branch} {virtualenv}"
  #     }
  #   '';
  # };
  programs.${shell} = {
    shellAliases = {
      z = "zellij";
      zls = "zellij ls";
      zka = "zellij ka -y";
      zda = "zellij da -y";
    };
    # initExtra = ''
    #   function precmd() {
    #     local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    #     local host=$(hostname)
    #     local title="%~"
    #     if [[ -n "$branch" ]]; then
    #       title+=" [ $branch]"
    #     fi
    #     title+=" @$host"
    #     print -Pn "\e]2;$title\a"
    #     # print -Pn "\e]2;%~\a"
    #   }
    # '';
  };
}
