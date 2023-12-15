{ inputs, pkgs, ... }:

{
  home.packages = with pkgs; [
    hyprland    
  ];

  home.username = "kaizen";
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;  
}
