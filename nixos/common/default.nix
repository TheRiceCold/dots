{ lib, ... }:
{
  imports = [ ./nixvim ];

  programs = {
    nano.enable = false;

    direnv = {
      enable = true; 
      nix-direnv.enable = true;
    };

    fzf = {
      keybindings = true;
      fuzzyCompletion = true;
    };

    bash = import ./bash.nix;
    thefuck.enable = true;
    wshowkeys.enable = true;
    less.enable = lib.mkDefault false; # I use bat
  };
}
