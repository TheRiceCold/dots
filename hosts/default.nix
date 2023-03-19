{ self, nixpkgs, inputs, ... }:

let
  user = "wolly";
  system = "x86_64-linux";
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
    modules =
      [ ./wayland ] ++
      [ ./system.nix ] ++
      [ inputs.nur.nixosModules.nur ] ++
      # [ inputs.hyprland.nixosModules.default ] ++
      [ inputs.home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit user; };
            users.${user} = {
              imports =
                [ (import ./home.nix) ];
                # [ inputs.hyprland.homeManagerModules.default ];
            };
          };
          nixpkgs = {
            overlays = [];
          };
        }
      ];
  };
}
