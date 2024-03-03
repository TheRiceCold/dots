{ inputs, ... }:
{
  imports = [ ./cli ./dev ./shell ./desktop ];

  nixpkgs.overlays = with inputs; [
    nur.overlay
    nixpkgs-wayland.overlay
  ];
}
