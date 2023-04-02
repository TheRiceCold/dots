{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; # Nix Packages
    nur.url = "github:nix-community/NUR"; # NUR Packages
    # hyprpicker.url = "github:hyprwm/hyprpicker";
    hyprland.url = "github:hyprwm/Hyprland";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, ... }:
  {
    nixosConfigurations = (
      import ./hosts {
        inherit nixpkgs self inputs;
      }
    );
  };
}
