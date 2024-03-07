{ inputs, ... }:

let
  inherit (inputs.nixpkgs.lib) nixosSystem;
  inherit (inputs.disko.nixosModules) disko;

  mkHost = {
    modules,
    stateVersion ? "23.11",
    system ? "x86_64-linux",
    disk ? ./disks/thinkpad.nix,
  }: nixosSystem {
    inherit system;
    modules = [ disko ./shared ] ++ modules;
    specialArgs = { inherit inputs disk stateVersion; };
  };
in {
  kaizen = mkHost { modules = [ ./hosts/kaizen ]; };
  minimo = mkHost { modules = [ ./hosts/minimo ]; };
}
