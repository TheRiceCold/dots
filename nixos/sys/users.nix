{ pkgs, ... }:

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

      packages = with pkgs; [
        direnv
        zoxide
        starship        
      ];
    };
  };
}
