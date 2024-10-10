{ inputs, pkgs, ... }: let
  hyprspace = inputs.hyprspace.packages.${pkgs.system}.Hyprspace;
in {
  wayland.windowManager.hyprland = {
    plugins = [hyprspace];
    settings.plugin = {
      overview = {
        panelHeight = 150;
        exitOnClick = true;
        showNewWorkspace = false;
      };
    };
  };
}
