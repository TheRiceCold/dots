{ ... }:

{
  security = {
    rtkit.enable  = true;
    polkit.enable = true;

    sudo.enable = false;
    doas = {
      enable = true;
      extraConfig = "
        permit nopass :wheel
      ";
    };
  };
}
