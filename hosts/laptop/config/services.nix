{ pkgs, ... }:

{
  services = {
    pipewire = {
      enable = true;
      alsa   = {
        enable        = true;
        support32Bit  = true;
      };
      jack.enable     = true;
      pulse.enable    = true;
    };

    dbus.enable       = true;
    blueman.enable    = true;
    openssh.enable    = true;

    create_ap = {
      enable = true;
      settings = {
        INTERNET_IFACE = "enp3s0f0";
        WIFI_IFACE = "wlp1s0";
        SSID = "wolly";
        PASSPHRASE = "1234qwer";
      };
    };

    # udev.packages = with pkgs; [ android-udev-rules ];
  };
}
