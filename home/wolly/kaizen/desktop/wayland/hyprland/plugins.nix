{ pkgs, ... }: {
  wayland.windowManager.hyprland = {
    plugins = with pkgs.hyprlandPlugins; [hyprspace hyprscroller];
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
