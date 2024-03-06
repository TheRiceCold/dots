{ pkgs, ... }:
{
  programs = {
    foot = import ./foot.nix;
    # wezterm = import ./wezterm.nix; # Cool term but, still foot on top!
  };
}
