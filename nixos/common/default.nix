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

    thefuck.enable = true;
    wshowkeys.enable = true;
    bash = import ./bash.nix;
    less.enable = lib.mkDefault false; # I'd rather use bat
  };
}
