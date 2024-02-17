{ inputs, pkgs, ... }:

{
  plugins = with inputs.hyprland-plugins.packages.${pkgs.system}; [
    # hyprbars
    hyprtrails
  ];

  settings.plugin = {
    hyprtrails = {
      color = "rgba(ffaa00ff)";
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
}
