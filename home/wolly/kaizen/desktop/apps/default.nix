{ pkgs, ... }:
{
  imports = [
    ./foot.nix      # Terminal client
    ./sioyek.nix    # PDF viewer
    ./spicetify.nix # Customized spotify
    # ./vscodium    # Less bloated vscode
  ];

  programs.mpv = {
    enable = true;
    config.gpu-context = "wayland";
    scripts = with pkgs.mpvScripts; [ mpris thumbnail ];
  };

  home.packages = with pkgs; [
    # Graphic Editors
    blender     # 3d graphics
    inkscape    # Vector graphics.
    libresprite # Pixel art tool.
    krita       # Raster graphics, mostly used this for digital art/drawing

    # Other Stuff
    # wine-staging
    # bottles-unwrapped

    easyeffects # Equalizer
    pavucontrol # Audio/Volume control

    neovide     # Cool neovim GUI client
    godot_4     # Open source game engine
   ];
}
