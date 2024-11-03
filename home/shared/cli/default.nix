{ pkgs, ... }: {
  imports = [
    ./bat
    ./btop
    ./git
    ./tmux
    # ./zellij # Great but I still prefer tmux
  ];

  programs = {
    fd.enable = true;
    # eza.enable = true; # Would be enabled if wasn't using nushell
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
    sc-im # Ncurses spreadsheet program for terminal
    curlie # frontend to curl that adds ease of use of httpie
  ];
}
