{
  enable = true;
  colorSchemes = {
    catppuccin-mocha = {
      background = "#1e1e2e";
      ansi = [
        "#45475a"
        "#f38ba8"
        "#a6e3a1"
        "#f9e2af"
        "#89b4fa"
        "#f5c2e7"
        "#94e2d5"
        "#bac2de"
      ];
      brights = [
        "#585b70"
        "#f38ba8"
        "#a6e3a1"
        "#f9e2af"
        "#89b4fa"
        "#f5c2e7"
        "#94e2d5"
        "#a6adc8"
      ];
      compose_cursor = "#f2cdcd";
      cursor_bg = "#f5e0dc";
      cursor_border = "#f5e0dc";
      cursor_fg = "#11111b";
      foreground = "#cdd6f4";
      scrollbar_thumb = "#585b70";
      selection_bg = "#585b70";
      selection_fg = "#cdd6f4";
      split = "#6c7086";
      visual_bell = "#313244";
    };
  };

  extraConfig = /* lua */ ''
    return {
      font_size = 12.0,
      enable_wayland = true,
      color_scheme = "catppuccin-mocha",
      hide_tab_bar_if_only_one_tab = true,
      window_close_confirmation = "NeverPrompt",

      inactive_pane_hsb = {
        saturation = 0.9,
        brightness = 0.8,
      },
    }
  '';
}
