{ pkgs, ... }: {
  wayland.windowManager.hyprland = {
    plugins = with pkgs.hyprlandPlugins; [
      hyprspace

      # TODO: Find a way to use this plugin with hyprland xwayland working properly
      # hyprscroller
    ];
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

