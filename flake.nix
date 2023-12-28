{
  description = "My Configuration Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
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
}
