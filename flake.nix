{
  description = "My Configuration Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
 };
  
  outputs = inputs @ { ... }: {
    nixosConfigurations = import ./nixos { inherit inputs; };
    homeConfigurations = import ./home { inherit inputs; };
  };

  # nixConfig.trusted-users = [ "root" "@wheel" ];
}
