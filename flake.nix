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
    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    hyprpaper.url = "github:hyprwm/hyprpaper";
 };
  
  outputs = inputs @ { ... }: {
    nixosConfigurations = import ./nixos { inherit inputs; };
    homeConfigurations = import ./home { inherit inputs; };
  };

  # nixConfig.trusted-users = [ "root" "@wheel" ];
}
