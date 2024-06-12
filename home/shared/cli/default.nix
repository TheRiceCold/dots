{ pkgs, ... }:
{
  imports = [ ./bat.nix ./zellij ];

  programs = {
    bash = {
      enable = true;
      shellAliases = {
        zj = "zellij";
        curl = "curlie";
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
    k9s.enable = true;
    lazygit.enable = true;

    yazi = {
      # NOTE: I should probably configure this
      enable = true;
      enableBashIntegration = true;
      keymap = { };
      settings = { };
      theme = { };
    };
  };

  home.packages = with pkgs; [
    fd        # simple and fast alternative to find
    sc-im     # Ncurses spreadsheet program for terminal
    curlie    # Frontend to curl that adds ease of use of httpie
  ];
}
