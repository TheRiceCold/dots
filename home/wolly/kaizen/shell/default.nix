{ lib, ... }: {

  programs = {
    bash = {
      enable = true;
      shellAliases = {
        zj = "zellij";

        l = "eza -l --icons --git -a";
        lt = "eza --tree --level=2 --long --icons --git";
      };

      initExtra = /* bash */ ''
        eval "$(starship init bash)"
      '';
    };

    starship = import ./starship.nix lib;
  };
}
