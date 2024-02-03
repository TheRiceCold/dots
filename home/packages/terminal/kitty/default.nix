{
  imports = [ ./colors/catpuccin-mocha.nix ];
  programs.kitty = {
    enable = true;
    font = {
      size = 12;
      name = "FiraCode Nerd Font";
    };
    settings = {
      tab_fade = 1;
      tab_bar_style = "fade";
      cursor_shape = "underline";
      confirm_os_window_close = 0;
    };
  };
}
