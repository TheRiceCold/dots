{ config, ... }:

let
  ifExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  users = {
    groups = { };

    users = {
      wolly = {
        isNormalUser = true;
        # shell = pkgs.nushell; # Cool shell but I rarely use it's features
        extraGroups = [ "wheel" "video" "audio" ] ++ ifExist [
          "kvm"
          "docker"
          "podman"
          "adbusers"
          "libvirtd"
          "networkmanager"
        ];
      };
    };
  };
}
