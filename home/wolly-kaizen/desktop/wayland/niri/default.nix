{ inputs, pkgs, config, ... }:
{
  imports = [inputs.niri-flake.homeModules.niri];
  nixpkgs.overlays = [inputs.niri-flake.overlays.niri];

  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
    settings = {
      binds = import ./binds.nix config.lib.niri.actions;
    };
  };

  home = {
    packages = [pkgs.xwayland-run];
    sessionVariables = {
      XDG_SESSION_DESKTOP = "Hyprland";
      XDG_CURRENT_DESKTOP = "Hyprland";
    };
  };
}
