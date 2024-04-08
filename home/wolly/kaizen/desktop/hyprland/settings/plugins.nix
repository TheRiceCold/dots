{ inputs, pkgs, ... }: 
let
  plugins = inputs.hyprland-plugins.packages.${pkgs.system};
in {
  wayland.windowManager.hyprland = {
    plugins = with plugins; [
      # hyprexpo # INFO: Wait until stable
      # hyprbars # WARN: this affects ags windows/widgets.
    ];

    settings.plugin = {
      hyprexpo = {
        columns = 3;
        gap_size = 5;
        bg_col = "rgb(111111)";
        workspace_method = "center current"; # [center/first] [workspace] e.g. first 1 or center m+1

        enable_gesture = true; # laptop touchpad, 4 fingers
        gesture_distance = 300; # how far is the "max"
        gesture_positive = true; # positive = swipe down. Negative = swipe up.
      };

      # hyprbars = {
      #   bar_color = "rgb(2a2a2a)";
      #   bar_height = 28;
      #   col_text = "rgba(ffffffdd)";
      #   bar_text_size = 11;
      #   bar_text_font = "Ubuntu Nerd Font";

      #   buttons = {
      #     button_size = 0;
      #     "col.maximize" = "rgba(ffffff11)";
      #     "col.close" = "rgba(ff111133)";
      #   };
      # };
    };
  };
}
