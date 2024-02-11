{ lib, ... }:

let
  shellAliases = {
    v = "lvim";
    zj = "zellij";
    lg = "lazygit";

    l = "eza -l --icons --git -a";
    lt = "eza --tree --level=2 --long --icons --git";
  };
in { 
  programs = {
    git = {
      enable = true;
      userName = "kaizen-dw";
      userEmail = "dalewaltergh@gmail.com";
      extraConfig = {
        color.ui = true;
        core.editor = "lvim";
      };
    };

    zoxide = {
      enable = true;
      options = [ "--cmd cd" ];
    };

    starship = import ./starship.nix { inherit lib; };

    bash = {
      enable = true;
      inherit shellAliases; 
      initExtra = ''
        eval "$(zoxide init bash)"
        eval "$(starship init bash)"
      '';
    };
  };
}
