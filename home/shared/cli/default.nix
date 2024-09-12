{ pkgs, ... }:
{
  imports = [ ./git.nix ./zellij ];

  programs = {
    bat = {
      enable = true;
      config = {
        pager = "less -FR";
        # theme = "Catppuccin-mocha";
      };
    };

    btop = {
      enable = true;
      settings = {
        vim_keys = true;
        rounded_corners = true;
        theme_background = false;
        color_theme = "tokyo-storm";
      };
    };

    eza.enable = true;
    taskwarrior.enable = true;

    yazi = {
      enable = true;
      enableBashIntegration = true;
      keymap = { };
      settings = { };
      theme = { };
    };

    zoxide = {
      enable = true;
      enableBashIntegration = true;
      options = [ "--cmd cd" ];
    };
  };

  home.packages = with pkgs; [
    fd        # simple and fast alternative to find
    sc-im     # Ncurses spreadsheet program for terminal
    curlie    # Frontend to curl that adds ease of use of httpie
  ];
}
