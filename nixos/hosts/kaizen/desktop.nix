{ inputs, pkgs, ... }: {
  environment = {
    systemPackages = let
      kaivim = inputs.kaizen.packages.${pkgs.system}.default;
    in [ kaivim ];
    loginShellInit = /*sh*/ ''
      if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
        exec Hyprland
      fi
    '';
  };

  programs = {
    virt-manager.enable = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };

  virtualisation.libvirtd = {
    enable = true;
    qemu.package = pkgs.qemu;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };

  services = {
    gvfs.enable = true;
    upower.enable = true;
    power-profiles-daemon.enable = false;
  };
}
