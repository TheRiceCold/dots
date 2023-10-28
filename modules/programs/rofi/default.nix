{ config, user, lib, pkgs, ... }:

{
  config = lib.mkIf (config.wlwm.enable) {
    home-manager.users.${user} = {
      home = {
        packages = with pkgs; [
          rofi-wayland
        ];
      };
    };
  };
}
