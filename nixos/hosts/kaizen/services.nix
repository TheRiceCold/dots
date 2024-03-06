{
  services = {
    blueman.enable = true;
    flatpak.enable = true;
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
    gnome.gnome-keyring.enable = true;
    power-profiles-daemon.enable = true;
  };
}

