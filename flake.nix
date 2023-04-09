{
  inputs = {
    nixpkgs.url       = "github:nixos/nixpkgs/nixos-unstable";  # Nix Packages
    nur.url           = "github:nix-community/NUR";             # NUR Packages

    hyprpicker.url    = "github:hyprwm/hyprpicker";             # Hyprpicker
    hyprland.url      = "github:hyprwm/Hyprland";               # Hyprland

    home-manager = {                                            # Home Manager
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... } @ inputs: {
    nixosConfigurations = (
      import ./hosts {
        inherit nixpkgs self inputs;
      }
    );
  };
}
