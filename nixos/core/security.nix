{ 
  security = {
    sudo.enable = false;
    rtkit.enable = true;

    doas = {
      enable = true;
      extraConfig = " permit nopass :wheel ";
    };
  }; 
}
