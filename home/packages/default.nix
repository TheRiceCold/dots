{ inputs, ... }:
{
  imports = [
    ./cli
    ./dev
    ./shell
    ./games
    ./desktop
    ./terminal
  ];

  nixpkgs.overlays = with inputs; [
    nur.overlay
    nixpkgs-wayland.overlay
  ];
}
