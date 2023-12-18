{ pkgs, config, ... }:

let
  ifExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in{
  users = {
    groups = { };

    users.kaizen = {
      isNormalUser = true;
      shell = pkgs.nushell;
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

      packages = [ pkgs.home-manager ];
    };
  };
}
