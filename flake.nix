{
  description = "My Configuration Flake";

  inputs = {
    # nixpkgs.url = "nixpkgs/nixos-23.11";
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ags.url = "github:Aylur/ags";
    more-waita = {
      url = "github:somepaulo/MoreWaita";
      flake = false;
    };
 };
  
  outputs = inputs @ { ... }: {
    nixosConfigurations = import ./nixos { inherit inputs; };
    homeConfigurations = import ./home { inherit inputs; };
  };

  # nixConfig.trusted-users = [ "root" "@wheel" ];
}
