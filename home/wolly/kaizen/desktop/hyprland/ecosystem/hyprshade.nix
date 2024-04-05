{ pkgs, ... }: {
  home.packages = [ pkgs.hyprshade ];

  xdg.configFile."hypr/hyprshade.toml".text = /* toml */ ''
    [[shades]]
    name = "vibrance"
    default = true  # shader to use during times when there is no other shader scheduled

    [[shades]]
    name = "blue-light-filter"
    # start_time = 19:00:00
    # end_time = 06:00:00   # optional if you have more than one shade with start_time
  '';
}
