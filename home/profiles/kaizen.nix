{ inputs, pkgs, ... }:

{
  imports = [ 
    ../features
  ];

  home = {
    username = "kaizen";
    homeDirectory = "/home/kaizen";
    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;  
}
