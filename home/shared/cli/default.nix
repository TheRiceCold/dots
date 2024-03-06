{ pkgs, ... }:
{
  imports = [ ./bat.nix ];

  programs = {
    btop = {
      enable = true;
      settings = {
        vim_keys = true;
        rounded_corners = true;
        theme_background = false;
        color_theme = "tokyo-storm";
      };
    };

    k9s.enable = true;
    lazygit.enable = true;
  };

  home.packages = with pkgs; [ kubectl kubernetes-helm ];
}
