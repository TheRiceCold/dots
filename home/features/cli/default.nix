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
    lazygit

    glow
    onefetch
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
