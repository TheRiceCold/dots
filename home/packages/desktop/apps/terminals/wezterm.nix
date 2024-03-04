{
  enable = true;
  # colorSchemes = { };

  extraConfig = /* lua */ ''
    return {
      font_size = 12.0,
      hide_tab_bar_if_only_one_tab = true,
      window_close_confirmation = "NeverPrompt",
    }
  '';
}
