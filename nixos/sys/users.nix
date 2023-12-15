{ ... }:

{
  users = {
    groups = { };

    users.kaizen = {
      isNormalUser = true;
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
