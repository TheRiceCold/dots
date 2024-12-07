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

    bash.shellAliases = {
      yz = "yazi";
      curl = "curlie";
    };
  };

  home.packages = with pkgs; [
    sc-im # Ncurses spreadsheet program for terminal
    curlie # frontend to curl that adds ease of use of httpie
    tealdeer
  ];
}
