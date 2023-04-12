{ ... }:

{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        offset = "0";
        height  = "300";
        width   = "300";
        min_icon_size = 32;
        max_icon_size = 128;
        frame_width = 2;
        frame_color = "#79BBDB";
        separator_color = "frame";
        font = "JetBrainsMono Nerd Font 10";
      };
      urgency_low = {
        background = "#1E1E2E";
        foreground = "#79BBDB";
      };
      urgency_normal = {
        background = "#1A1F38";
        foreground = "#79BBDB";
      };
      urgency_critical ={
        background = "#1E1E2E";
        foreground = "#79BBDB";
        frame_color = "#FAB387";
      };
    };
  };
}
