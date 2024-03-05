{ inputs, pkgs, ... }:
{
  imports = [ inputs.hyprlock.homeManagerModules.default ];
  programs.hyprlock = {
    enable = true;
    general = { };
    backgrounds = [
      {
        monitor = "";
        path = "${./images/yukopi.png}";
        blur_passes = 3;
        contrast = 0.8916;
        brightness = 0.8172;
        vibrancy = 0.1696;
        vibrancy_darkness = 0.0;
      }
    ];
    input-fields = [
      {

      }
    ];
    labels = [
      {
        monitor = "";
        text = ''cmd[update:1000] echo "$(date +"%-I:%M%p")"'';
        font_size = 120;
        position = { x = 0; y = -300; };
        halign = "center";
        valign = "top";
      }
    ];
  };
}
