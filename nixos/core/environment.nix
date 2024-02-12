{ pkgs, ... }:
{ 
  environment.systemPackages = with pkgs; [
    bat
    gcc
    btop
    lsof
    wget
    clang
    gnumake
    home-manager
  ];
}
