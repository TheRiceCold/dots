{
  description = "My Configuration Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ags.url = "github:Aylur/ags";
 };
  
  outputs = inputs @ { ... }: {
    homeConfigurations = import ./home { inherit inputs; };
    nixosConfigurations = import ./nixos { inherit inputs; };
  };
}
