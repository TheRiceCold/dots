{ 
  security = {
    sudo.enable = false;
    # Enable real-time kit
    rtkit.enable = true;

    doas = {
      enable = true;
      extraConfig = " permit nopass :wheel ";
    };
  }; 
}
