{
  services = {
    # xserver = {
      # enable = true;
      # displayManager = {
      #   sddm = {
      #     enable = true;
      #     wayland = {
      #       enable = true;
      #       compositorCommand = ''
      #         Hyprland
      #       '';
      #     };
          # theme = "";
        # };
        # setupCommands = "Hyprland";
      # };
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

    blueman.enable = true;
    gvfs.enable = true;
    upower.enable = true;
    devmon.enable = true;
    udisks2.enable = true;
    accounts-daemon.enable = true;
    power-profiles-daemon.enable = true;
    gnome = {
      evolution-data-server.enable = true;
      glib-networking.enable = true;
      gnome-keyring.enable = true;
      gnome-online-accounts.enable = true;
    };
  };
}
