{ ... }:

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
  };
}
