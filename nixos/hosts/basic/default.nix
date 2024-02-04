{ pkgs, name, stateVersion, ... }:

{
  imports = [ 
    ./hardware-configuration.nix 
  ];

  networking.hostName = name;
  system.stateVersion = stateVersion;
}
