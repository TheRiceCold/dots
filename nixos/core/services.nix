{
  services = {
    # xserver = {
    #   enable = true;
    #   displayManager = {
    #     sddm = {
    #       enable = true;
    #   #     wayland = {
    #   #       enable = true;
    #   #       compositorCommand = ''
    #   #         Hyprland
    #   #       '';
    #   #     };
    #       # theme = "";
    #     };
    #     setupCommands = ''
    #       if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
    #         exec Hyprland
    #       fi
    #     '';
    #   };
    # };

    dbus.enable = true;
    openssh.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;

      jack.enable = true;
      pulse.enable = true;
    };

    create_ap = {
      enable = true; 
      settings = {
        SSID = "wolly";
        PASSPHRASE = "1234qwer";
        WIFI_IFACE = "wlp1s0";
        INTERNET_IFACE = "enp3s0f0";
      };
    };

    gvfs.enable = true;
    upower.enable = true;
    devmon.enable = true;
    blueman.enable = true;
    udisks2.enable = true;
    accounts-daemon.enable = true;
    power-profiles-daemon.enable = true;

    flatpak.enable = true;
    gnome = {
      gnome-keyring.enable = true;
      glib-networking.enable = true;
      evolution-data-server.enable = true;
      gnome-online-accounts.enable = true;
    };
  };
}
