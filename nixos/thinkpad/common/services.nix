{ pkgs, ... }:

{
  services = {
    pipewire = {
      enable = true;
      jack.enable = true;
      pulse.enable = true;

      alsa.enable = true;
      alsa.support32Bit  = true;
    };

    dbus.enable = true;
    blueman.enable = true;
    openssh.enable = true;

    create_ap = {
      enable = true;
      settings = {
        SSID = "wolly";
        PASSPHRASE = "1234qwer";

        WIFI_IFACE = "wlp1s0";
        INTERNET_IFACE = "enp3s0f0";
      };
    };

    # udev.packages = with pkgs; [ android-udev-rules ];
  };
}
