{
  description = "My Personal NixOS Configuration";

  inputs =
    {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
      home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
      };
    };

  outputs = inputs @ { self, nixpkgs, ... }:
    let
      user = "wolly";
    in
    {
      nixosConfigurations = (
        import ./hosts {
          system = "x86_64-linux";
          inherit nixpkgs self inputs user;
        }
      );
    };
}
