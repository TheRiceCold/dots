let
  font_family = "Ubuntu Nerd Font";
in [
  { # Date
    monitor = "";
    valign = "top";
    halign = "center";
    font_size = 16;
    position = { x = 0; y = -100; };
    text = ''cmd[update:5000] echo "<b>$(date +"%A, %d %B")</b>"'';
    inherit font_family;
  }
  { # Time
    monitor = "";
    valign = "top";
    halign = "center";
    font_size = 128;
    position = { x = 0; y = -100; };
    text = ''cmd[update:1000] echo "<b>$(date +"%I:%M%p")</b>"'';
    inherit font_family;
  }

  { # User
    monitor = "";
    font_size = 20;
    halign = "center";
    valign = "bottom";
    position = { x = 0; y = 150; };
    text = "   $USER";
    inherit font_family;
  }

  # { # Type to unlock
  #   monitor = "";
  #   font_size = 16;
  #   halign = "center";
  #   valign = "bottom";
  #   position = { x = 0; y = 30; };
  #   text = "Hey nerd, type to unlock";
  #   inherit font_family;
  # }
]
