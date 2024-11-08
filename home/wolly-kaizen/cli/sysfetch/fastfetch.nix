{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "sixel";
        source = ../../../../../assets/ibu-cyber.jpg;
      };

      display.separator = " ";
      modules = let
        mod = type: key: {
          inherit type key;
          keyColor = "blue";
        };
      in [
        "break"
        {
          type = "custom";
          format = " \u001b[90m  \u001b[31m  \u001b[32m  \u001b[33m  \u001b[34m  \u001b[35m  \u001b[36m  \u001b[37m  \u001b[38m  \u001b[39m";
        }
        "break"

        (mod "cpu" "╭─")
        (mod "disk" "├─")
        (mod "memory" "╰─󰑭")
        "break"

        (mod "shell" "╭─")
        (mod "wm" "├─")
        (mod "font" "╰─")
        "break"

        {
          type = "title";
          key = "╭─";
          format = "{1}@{2}";
          keyColor = "blue";
        }

        (mod "os" "├─")
        (mod "packages" "├─")
        (mod "uptime" "╰─󱎫")
      ];
    };
  };
}

