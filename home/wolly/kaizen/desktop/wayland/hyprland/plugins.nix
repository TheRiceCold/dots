{ inputs, pkgs, ... }: let
  space = inputs.hyprspace.packages.${pkgs.system}.default;
  scroller = inputs.hyprscroller.packages.${pkgs.system}.default;
  # inherit (inputs.hyprland-plugins.packages.${pkgs.system}) hyprexpo;
in {
  wayland.windowManager.hyprland = {
    plugins = [ space scroller ];
    settings.plugin = {
      overview = {
        gapsOut = 8;
        panelHeight = 150;
        exitOnClick = true;
        showNewWorkspace = false;
      };
    };
  };
}
