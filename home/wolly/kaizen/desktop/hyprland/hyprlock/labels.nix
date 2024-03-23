let
  font_family = "Ubuntu Nerd Font";
  color = "rgb(142, 149, 177)";
in [
  { # Date
    monitor = "";
    font_size = 16;
    valign = "top";
    halign = "center";
    position = { x = 0; y = -100; };
    color = "rgba(211, 228, 228, 0.75)";
    text = ''cmd[update:5000] echo "$(date +"%A, %d %B")"'';
    inherit font_family;
  }
  { # Time
    monitor = "";
    font_size = 128;
    valign = "top";
    halign = "center";
    position = { x = 0; y = -100; };
    color = "rgba(211, 228, 228, 0.75)";
    text = ''cmd[update:1000] echo "$(date +"%I:%M")"'';
    inherit font_family;
  }

  { # User
    monitor = "";
    font_size = 20;
    halign = "center";
    valign = "center";
    text = "Hi, $USER";
    position = { x = 0; y = -200; };
    inherit font_family color;
  }
]
