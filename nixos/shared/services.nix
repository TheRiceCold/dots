{
  services = {
    dbus.enable = true;
    openssh.enable = true;
    libinput = {
      enable = true;
      touchpad = {
        tapping = true;
        middleEmulation = true;
        naturalScrolling = true;
      };
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;

      jack.enable = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
  };
}
