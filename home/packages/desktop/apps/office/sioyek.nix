{ pkgs, ... }:
{
  home.packages = [ pkgs.sioyek ];
  xdg.configFile."sioyek/prefs_user.config".text = ''
    custom_background_color     0.1176 0.1176 0.180
    custom_text_color           0.804  0.839 0.957
    font_ui                     JetBrainsMono Nerd Font

    status_bar_font_size    10
    status_bar_color        0.1176 0.1176 0.180
    status_bar_text_color   0.804   0.839  0.957
  '';
}
