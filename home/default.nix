{ inputs, ... }:

let
  inherit (inputs) nixpkgs home-manager;
  lib = nixpkgs.lib // home-manager.lib;

  pkgsFor = lib.genAttrs [ "x86_64-linux" ] (
    system: import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    }
  );  

  mkHome = { user, host, system, modules }: {
    "${user}@${host}" = lib.homeManagerConfiguration {
      pkgs = pkgsFor.x86_64-linux;
      extraSpecialArgs = { inherit inputs; };
      modules = [ ./profiles/${user}.nix ];
    };
  };
in (
  # Main
  mkHome {
    user = "kaizen";
    host = "thinkpad";
    system = "x86-64_linux";
    modules = [];
  }
)
