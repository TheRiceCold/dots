{ pkgs, ... }: {
  imports = [./spicetify.nix ./graphic-editors];

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
        theme = "catppuccin-mocha";
        font.size = 12.0;
        font.normal = ["JetBrainsMono Nerd Font"];
      };
    };

    obs-studio.enable = true;
  };

  home.packages = with pkgs; [
    vesktop       # Custom discord app
    pavucontrol   # Audio/Volume control
  ];
}
