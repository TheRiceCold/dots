{ ... }:
{
  users = {
    groups = { };

    users.wolly = {
      isNormalUser = true;
      home = "/home/wolly";
      initialPassword = "password";
      extraGroups = [ 
        "wheel" 
        "podman"
        "libvirtd"
        "networkmanager" 
      ];
    };
  };
}
