{
  sound.enable = true;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    jack.enable = true;
    pulse.enable = true;

    alsa.enable = true;
    alsa.support32Bit = true;
  };
}
