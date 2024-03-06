{ inputs, ... }:
{
  imports = [ ./cli ./shell ./desktop ];
  nixpkgs.overlays = [ inputs.nixpkgs-wayland.overlay ];
}
