{ inputs, ... }:
{
  imports = [
    ./cli
    ./dev
    ./desktop
    ./scripts
  ];
  nixpkgs.overlays = [ inputs.nixpkgs-wayland.overlay ];
}
