{ pkgs, ... }:
{
  programs = {
    foot = import ./foot.nix;
    # wezterm = import ./wezterm.nix;
  };
}
