{ inputs, ... }:

let
  inherit (inputs) home-manager;
  mkHome = { name, host, modules }: {
    "${name}@${host}" = home-manager.lib.homeManagerConfiguration {
      specialArgs = { inherit inputs; };
      modules = [];
    };
  };
in {
  flake.homeConfiguration = (
    mkHome = { 
      name = "kaizen";
      host = "thinkpad";
      modules = [ ];
    } 
  );
}
