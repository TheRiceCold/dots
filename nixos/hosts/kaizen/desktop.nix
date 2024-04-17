{ inputs, pkgs, ... }:
let
  kaivim = inputs.kaivim.packages.${pkgs.system}.default;
  kaizen = inputs.kaizen.packages.${pkgs.system}.default;
  hyprland = inputs.hyprland.packages.${pkgs.system}.default;
in {
  environment.systemPackages = with pkgs; [ kaizen kaivim linux-wifi-hotspot ];

  programs = {
    droidcam.enable = true;
    virt-manager.enable = true;
    hyprland = {
      enable = true;
      package = hyprland;
      xwayland.enable = true;
    };
  };

  virtualisation = {
    waydroid.enable = true;
    libvirtd = {
      enable = true;
      qemu.package = pkgs.qemu;
    };
  };

  hardware.opentabletdriver.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  security.pam.services.ags = {};

  services = {
    gvfs.enable = true;
    upower.enable = true;
    power-profiles-daemon.enable = false;
    # greetd = {
    #   enable = true;
    #   settings.default_session.command = pkgs.writeShellScript "greeter" ''
    #     ${inputs.kaizen.packages.${pkgs.system}.default}/bin/greeter
    #   '';
    # };
  };

  # systemd.tmpfiles.rules = [ "d '/var/cache/greeter' - greeter greeter - -" ];

  # system.activationScripts.wallpaper = ''
  #   PATH=$PATH:${pkgs.busybox}/bin:${pkgs.jq}/bin
  #   CACHE="/var/cache/greeter"
  #   OPTS="$CACHE/options.json"
  #   HOME="/home/$(find /home -maxdepth 1 -printf '%f\n' | tail -n 1)"

  #   cp $HOME/.cache/ags/options.json $OPTS
  #   chown greeter:greeter $OPTS

  #   BG=$(cat $OPTS | jq -r '.wallpaper // "$HOME/.config/background.png"')
  #   cp $BG $CACHE/background
  #   chown greeter:greeter $CACHE/background
  # '';
}
