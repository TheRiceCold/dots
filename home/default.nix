{ inputs, ... }:

let
  inherit (inputs) nixpkgs home-manager;

  mkHome = {
    modules,
    stateVersion ? "23.11",
    system ? "x86_64-linux",
  }: home-manager.lib.homeManagerConfiguration {
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    modules = [ ./shared ] ++ modules;
    extraSpecialArgs = { inherit inputs stateVersion; };
  };
in {
  "wolly@kaizen" = mkHome { modules = [ ./wolly/kaizen ]; };
  "wolly@minimo" = mkHome { modules = [ ./wolly/minimo ]; };
}
