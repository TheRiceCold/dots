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
}
