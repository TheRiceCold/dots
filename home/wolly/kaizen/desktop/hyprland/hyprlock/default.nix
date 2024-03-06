# TODO: Improve design.
{ inputs, pkgs, ... }:
{
  imports = [ inputs.hyprlock.homeManagerModules.default ];
  programs.hyprlock = {
    enable = true;
    general = {

    };
    backgrounds = [
      {
        monitor = "";
        blur_size = 4;
        blur_passes = 3;
        noise = 0.0117;
        contrast = 1.3000;
        brightness = 0.8000;
        vibrancy = 0.2100;
        vibrancy_darkness = 0.0;
        path = "${./images/yukopi.png}"; # only png supported for now
      }
    ];
    input-fields = [
      { # Password
        monitor = "";
        halign = "center";
        valign = "center";
        outline_thickness = 3;
        dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8
        dots_spacing = 0.5; # Scale of dots' absolute size, 0.0 - 1.0
        dots_center = true;
        hide_input = false;
        fade_on_empty = true;
        position = { x = 0; y = -120; };
        size = { width = 250; height = 50; };
        font_color = "rgb(200, 200, 200)";
        outer_color = "rgba(0, 0, 0, 0)";
        inner_color = "rgba(0, 0, 0, 0.5)";
        # font_family = "JetBrainsMono Nerd Font";
        placeholder_text = ''<i>Password</i>'';
      }
    ];
    labels = import ./labels.nix;
  };
}
