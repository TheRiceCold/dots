{ pkgs, ... }: {
  imports = [ 
    ./joshuto.nix
    ./tmux.nix
    ./neofetch
    # ./zellij.nix
  ];

  home.packages = with pkgs; [
    # zoxide
    direnv
    lazygit
  ];
}
