{ pkgs, ... }: 
{
  imports = [ 
    ./bat.nix
    ./btop.nix
    ./tmux.nix
    ./yazi.nix
    ./zellij.nix
    ./zoxide.nix

    ./neofetch
  ];

  home.packages = with pkgs; [
    direnv
    lazygit
  ];
}
