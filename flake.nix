{
  description = "My Configuration Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Overlays
    nur.url = "github:nix-community/NUR";
    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";

    # My own configurations
    kaizen.url = "github:thericecold/kaizen";
    kaivim.url = "github:thericecold/kaivim";

    # Hyprland and plugins
    hyprland.url = "github:hyprwm/Hyprland";
    hyprspace = {
      url = "github:KZDKM/Hyprspace";
      inputs.hyprland.follows = "hyprland";
    };
    hyprscroller = {
      url = "github:dawsers/hyprscroller";
      inputs.hyprland.follows = "hyprland";
    };

    tmux-sessionx.url = "github:omerxx/tmux-sessionx";
    spicetify-nix.url = "github:gerg-l/spicetify-nix";
  };

  outputs = inputs: {
    homeConfigurations = import ./home inputs;
    nixosConfigurations = import ./nixos inputs;
  };
}
