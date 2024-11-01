{ pkgs, ... }: {
  imports = [ ./shell ./sysfetch ];

  programs.neomutt = {
    # TODO: Set this up
    enable = true;
    vimKeys = true;
  };

  home.packages = with pkgs; [
    # Just fun stuff
    pipes-rs  # Animated pipes
    krabby    # Print pokemon sprites
    slides    # Presentation tool
    glow      # Render markdown on the CLI
    lsix      # Shows thumbnails in terminal using sixel
    upiano    # A piano in terminal

    # Games
    toipe # A truty typing tester
    uchess
    vitetris
  ];
}
