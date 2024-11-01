inputs: let
  inherit (inputs.nixpkgs.lib) nixosSystem;

  mkHost = {
    modules,
    stateVersion ? "24.05",
    system ? "x86_64-linux",
    disk ? ./disks/thinkpad.nix,
  }: nixosSystem {
    inherit system;
    modules = [ ./shared ] ++ modules;
    specialArgs = { inherit inputs disk stateVersion; };
  };
in {
  kaizen = mkHost { modules = [ ./hosts/kaizen ]; };
  minimo = mkHost { modules = [ ./hosts/minimo ]; };
}
