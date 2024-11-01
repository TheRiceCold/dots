{ pkgs, ... }: {
  imports = [
    ./bat
    ./btop
    ./git
    ./tmux
    # ./zellij # Great but I still prefer tmux
  ];

  programs = {
    eza.enable = true;
    taskwarrior = {enable = true;};
    yazi = {
      enable = true;
      enableBashIntegration = true;
      keymap = {};
      settings = {};
      theme = {
        border_style.fg = "#5ef1ff";
      };
    };
  };

  home.packages = with pkgs; [
    fd # simple and fast alternative to find
    sc-im # Ncurses spreadsheet program for terminal
    curlie # frontend to curl that adds ease of use of httpie
  ];
}
