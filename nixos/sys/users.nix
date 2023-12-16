{ pkgs, config, ... }:

let
  ifExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in{
  users = {
    groups = { };

    users.kaizen = {
      isNormalUser = true;
      initialPassword = "password";
      extraGroups = [ 
        "wheel" 
        "video"
        "audio"
      ] ++ ifExist [
        "docker"
        "podman"
        "libvirtd"
        "networkmanager" 
      ];

      packages = [ pkgs.home-manager ];
    };
  };
}
