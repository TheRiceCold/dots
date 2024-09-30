{
  programs.bat = {
    enable = true;
    config = {
      pager = "less -FR";
      theme = "cyberdream";
    };
  };

  xdg.configFile."bat/themes/cyberdream.tmTheme" = import ./cyberdream-theme.nix;
}
