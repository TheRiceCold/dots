{ pkgs, ... }: {
  imports = [ ./editors ./flutter.nix ];

  programs = {
    k9s.enable = true;
  };

  home.packages = with pkgs;
  with nodePackages;
  with python311Packages; [
    gobang

    distrobox
    lazydocker

    godot_4 # Open source game engine
  ];
}
