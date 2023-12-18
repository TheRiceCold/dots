{ pkgs, ... }: {
  imports = [ 
    ./starship.nix
    ./joshuto.nix
    ./neofetch

    ./tmux.nix
    # ./zellij.nix
  ];

  home.packages = with pkgs; [
    zoxide
    direnv
    lazygit
  ];
}
