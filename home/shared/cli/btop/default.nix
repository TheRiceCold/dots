{
  programs.btop = {
    enable = true;
    settings = {
      vim_keys = true;
      rounded_corners = true;
      theme_background = false;
      color_theme = "cyberdream";
    };
  };

  # Themes
  xdg.configFile."btop/themes/cyberdream.theme" = import ./cyberdream-theme.nix;
}
