{ pkgs, ... }: {
  imports = [ 
    ./neofetch
    ./bat.nix
    ./btop.nix
    ./tmux.nix
    ./yazi.nix
    # ./zellij.nix
  ];

  home.packages = with pkgs; [
    # zoxide
    direnv
    lazygit
  ];
}
