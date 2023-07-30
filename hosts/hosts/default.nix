{ self, nixpkgs, inputs, ... }:

let
  user = "wolly";
  lib = nixpkgs.lib;
  system = "x86_64-linux";
in

{
  wolly = lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs user; };
    modules =
      [ ./wayland ] ++
      [ ./system.nix ] ++
      [ inputs.nur.nixosModules.nur ] ++
      [ inputs.home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs     = true;
            useUserPackages   = true;
            extraSpecialArgs  = { inherit user; };
            users.${user} = {
              imports =
                [ (import ./wayland/home.nix) ] ++
                [ inputs.hyprland.homeManagerModules.default ];
            };
          };
          nixpkgs = {
            overlays = [];
          };
      }];
  };
}
