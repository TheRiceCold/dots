{ inputs, ... }:
{
  imports = [ ./cli ./dev ./shell ./desktop ];
  nixpkgs.overlays = with inputs; [ nixpkgs-wayland.overlay ];
}
