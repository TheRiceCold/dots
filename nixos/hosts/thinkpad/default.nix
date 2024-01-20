{ name, ... }:

{
  imports = [ ./hardware-configuration.nix ../../core ];
  networking.hostName = name;
  system.stateVersion = "23.11";
}
