{ inputs, config, ... }:

let
  home-manager = inputs.home-manager;
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
        "adbusers"
        "libvirtd"
        "networkmanager" 
      ];

      packages = [ home-manager ];
    };
  };
}
