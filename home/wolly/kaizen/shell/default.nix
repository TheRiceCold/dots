{ lib, ... }: {
  programs = {
    bash = {
      enable = true;
      shellAliases = {
        zj = "zellij";
      };

      initExtra = /* bash */ ''
        eval "$(starship init bash)"
      '';
    };

    starship = import ./starship.nix lib;
  };
}
