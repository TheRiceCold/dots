{ name, ... }:

{
  imports = [ ./hardware-configuration.nix ../../sys ];
  networking.hostName = name;
  system.stateVersion = "23.11";
}
