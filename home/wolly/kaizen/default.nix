{ inputs, ... }:
{
  imports = [ ./cli ./shell ./desktop ./scripts ];
  nixpkgs.overlays = [ inputs.nixpkgs-wayland.overlay ];
}
