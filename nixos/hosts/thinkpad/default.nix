{ name, ... }:

{
  imports = [ ./hardware-configuration.nix ];
  networking.hostName = name;
  system.stateVersion = "23.11";
}
