{ lib, ... }:

with lib;
{
  options = {
    hyprland.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
}
