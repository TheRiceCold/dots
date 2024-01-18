{ pkgs, ... }: {
  imports = [ 
    ./joshuto
    ./bat.nix
    ./neofetch
    ./btop.nix
    ./tmux.nix
    # ./zellij.nix
  ];

  home.packages = with pkgs; [
    # zoxide
    direnv
    lazygit
  ];
}
