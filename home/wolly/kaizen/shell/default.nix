{ lib, ... }: {
  programs = {
    starship = import ./starship.nix lib;
    bash.initExtra = /* bash */ '' eval "$(starship init bash)" '';
  };
}
