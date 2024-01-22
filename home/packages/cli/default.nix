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

  programs = {
    lazygit.enable = true;
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };

  home.packages = with pkgs; [
    onefetch
  ];
}
