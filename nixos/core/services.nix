{
  services = {
    dbus.enable = true;
    openssh.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;

      jack.enable = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };

    gvfs.enable = true;
    upower.enable = true;
    devmon.enable = true;
    blueman.enable = true;
    udisks2.enable = true;
    accounts-daemon.enable = true;
    power-profiles-daemon.enable = true;
  };
}
