{ config, ... }:

let
  ifExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  users = {
    groups = { };

    users.kaizen = {
      isNormalUser = true;
      # initialPassword = "password";
      hashedPassword = "$6$YQNB2dyXIfe7M8b.$gD9PYh3DvqZze3DvMq9RvdzEhZHbYomDeEISN6xqVfkXGp/GT1hNXH..PrO3s0U6HCjq0Oi/nu6AEw5s2JUjP/";
      extraGroups = [ "wheel" "video" "audio" ] ++ ifExist [
        "docker"
        "podman"
        "adbusers"
        "libvirtd"
        "networkmanager" 
      ];
    };
  };
}
