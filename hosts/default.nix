{ system, self, nixpkgs, inputs, user, ... }:

let
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true; # Allow proprietary software
  };

  lib = nixpkgs.lib;
in
{
  wolly = lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs user; };
    modules = [ ./system.nix ] ++ [
      inputs.home-manager.nixosModules.home-manager {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = { inherit user; };
          users.${user} = {
            imports = [
              (import ./home.nix)
            ];
          };
        };
        nixpkgs = { };
      }
     ];
  };
}
