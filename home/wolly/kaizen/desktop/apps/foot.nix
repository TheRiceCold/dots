{
  enable = true;
  server.enable = true;
  settings = {
    main = {
      term = "xterm-256color";
      font = "JetBrainsMonoNerdFont:size=12";
      notify = "notify-send -a \${app-id} -i \${app-id} \${title} \${body}";
    };

    cursor = {
      style = "beam";
      beam-thickness = 2;
    };

    bell = {
      urgent = "yes";
      notify = "yes";
      command = "notify-send bell";
      command-focused = "no";
    };

    mouse.hide-when-typing = "yes";
    key-bindings = {
      scrollback-up-page = "Page_Up";
      scrollback-down-page = "Page_Down";

      # clipboard-copy = "Control+c";
      clipboard-paste = "Control+v";

      search-start = "Control+f";
    };

    # search-bindings = { };

    colors = {
      # Catppuccin mocha
      alpha = "1.0";
      foreground = "cdd6f4"; # Text
      background = "1E1D2F"; # Base
      regular0 = "45475a"; # Surface 1
      regular1 = "f38ba8"; # red
      regular2 = "a6e3a1"; # green
      regular3 = "f9e2af"; # yellow
      regular4 = "89b4fa"; # blue
      regular5 = "f5c2e7"; # pink
      regular6 = "94e2d5"; # teal
      regular7 = "bac2de"; # Subtext 1
      bright0 = "585b70"; # Surface 2
      bright1 = "f38ba8"; # red
      bright2 = "a6e3a1"; # green
      bright3 = "f9e2af"; # yellow
      bright4 = "89b4fa"; # blue
      bright5 = "f5c2e7"; # pink
      bright6 = "94e2d5"; # teal
      bright7 = "a6adc8"; # Subtext 0
    };
  };
}
