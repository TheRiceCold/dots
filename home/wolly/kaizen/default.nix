{ inputs, pkgs, ... }:
{

  imports = [
    ./cli
    ./desktop
    ./scripts
  ];
  nixpkgs.overlays = [ inputs.nixpkgs-wayland.overlay ];

  home.packages = with pkgs; [
    roboto
    font-awesome
    source-sans-pro
    (pkgs.nerdfonts.override {
      fonts = [
        "Ubuntu"
        "UbuntuMono"
        "UbuntuSans"
        "RobotoMono"
      ];
    })
  ];
}
