pkgs: let
  colors = import ./colors.nix;
in {
  enable = true;
  package = pkgs.foot;
  server.enable = true;
  settings = {
    colors = colors.cyberdream;

    main = {
      term = "xterm-256color";
      font = "JetBrainsMonoNerdFont:size=11.5";
    };

    cursor = {
      style = "beam";
      beam-thickness = 2;
    };

    desktop-notifications = {
      command = "notify-send -a \${app-id} -i \${app-id} \${title} \${body}";
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

      # WARN: Control+c is used for terminating shell actions
      # clipboard-copy = "Control+c";
      clipboard-paste = "Control+v";

      search-start = "Control+f";
    };

    # search-bindings = { };
  };
}
