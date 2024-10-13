{ inputs, ... }:
{
  imports = [
    ./cli
    ./desktop
    ./scripts
  ];
  nixpkgs.overlays = [ inputs.nixpkgs-wayland.overlay ];
}
