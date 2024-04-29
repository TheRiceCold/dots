let
  monitor =  "";
  font_family = "Ubuntu Nerd Font";
  color = "rgba(211, 228, 228, 0.75)";
  date = int: format: ''cmd[update:${int}] echo "$(date +"${format}")"'';
in [
  { # Date
    font_size = 16;
    valign = "top";
    halign = "center";
    text = date "5000" "%A, %d %B";
    position = { x = 0; y = -115; };
    inherit monitor font_family color;
  }
  { # Time
    font_size = 72;
    valign = "top";
    halign = "center";
    text = date "1000" "%I:%M";
    position = { x = 0; y = -140; };
    inherit monitor font_family color;
  }

  { # User
    font_size = 20;
    halign = "center";
    valign = "center";
    position = { x = 0; y = -200; };
    text = ''Hi there, <span text_transform="capitalize">$USER</span>'';
    inherit monitor font_family color;
  }
]
