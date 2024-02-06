{ inputs, ... }:

let
  inherit (inputs) nixpkgs home-manager;

  mkHome = { user, host, modules }: {
    "${user}@${host}" = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
      extraSpecialArgs = { inherit inputs; };
      modules = [ ./profiles/${user}.nix ] ++ modules;
    };
  };
in (
  # Main
  mkHome {
    user = "kaizen";
    host = "thinkpad";
    modules = [ ./packages ./scripts ];
  }
)
