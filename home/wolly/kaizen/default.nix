{ inputs, pkgs, ... }: {

  imports = [ ./cli ./shell ./desktop ./scripts ];
  nixpkgs.overlays = [ inputs.nixpkgs-wayland.overlay ];

  home.packages = with pkgs; [
    font-awesome
    (pkgs.nerdfonts.override {
      fonts = [ "Ubuntu" "UbuntuMono" "CascadiaCode" "FiraCode" ];
    })
  ];
}
