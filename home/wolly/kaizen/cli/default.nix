{ pkgs, ... }: {
  imports = [ ./zellij ./sysfetch ];

  programs = {
    eza.enable = true;
    neomutt = {
      # TODO: Set this up
      enable = true;
      vimKeys = true;
    };
    yazi = {
      # NOTE: I should probably configure this
      enable = true;
      enableBashIntegration = true;
      keymap = { };
      settings = { };
      theme = { };
    };
  };

  home.packages = with pkgs; [
    fd        # simple and fast alternative to find
    curlie    # Frontend to curl that adds ease of use of httpie

    # Just fun stuff
    pipes-rs  # Animated pipes
    krabby    # Print pokemon sprites
    slides    # Terminal based presentation tool # TODO: Learn this
    lsix      # Shows thumbnails in terminal using sixel

    # Games
    toipe # A truty typing tester
    uchess
    vitetris
    _2048-in-terminal
  ];
}
