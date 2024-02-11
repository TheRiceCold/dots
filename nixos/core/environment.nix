{ pkgs, ... }:
{ 
  environment.systemPackages = with pkgs; [
    bat
    gcc
    git
    fzf
    btop
    lsof
    wget
    clang
    gnumake
    home-manager
  ];
}
