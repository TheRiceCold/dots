{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.linux-wifi-hotspot ];

  services = {
    create_ap = {
      enable = true; 
      settings = {
        SSID = "wolly";
        PASSPHRASE = "1234qwer";
        WIFI_IFACE = "wlp1s0";
        INTERNET_IFACE = "enp3s0f0";
      };
    };
  };
}
