{ pkgs, ... }: {
  imports = [
    ./opentablet
    ./krita.nix
    ./inkscape.nix
    ./spicetify.nix
  ];

  programs = {
    foot = import ./foot pkgs;
    sioyek = import ./sioyek.nix;
    mpv = {
      enable = true;
      config.gpu-context = "wayland";
      scripts = with pkgs.mpvScripts; [mpris thumbnail];
    };

    neovide = {
      enable = true;
      settings = {
        maximized = true;
        no-multigrid = true;
      };
    };

    # obs-studio.enable = true;
  };

  home.packages = with pkgs; [
    vesktop # A custom Discord desktop app
    pavucontrol # Audio/Volume control

    # gimp        # Image Maniputation
    blender     # 3d Graphics
    libresprite # Pixel Art
  ];
}
