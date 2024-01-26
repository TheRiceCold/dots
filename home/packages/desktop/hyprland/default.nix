{ pkgs, ... }:
{
  imports = [ ./settings ];
  wayland.windowManager.hyprland = {
    enable = true; 
    systemd.enable = true;
    xwayland.enable = true;
  };

  home = {
    sessionVariables = import ./variables.nix;
    packages = import ./packages.nix { inherit pkgs; };
  };
}
