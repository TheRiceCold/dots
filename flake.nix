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
    niri-flake.url = "github:sodiboo/niri-flake";

    # My own configurations
    kaizen.url = "github:thericecold/kaizen";
    kaivim.url = "github:thericecold/kaivim";

    tmux-sessionx.url = "github:omerxx/tmux-sessionx";
    spicetify-nix.url = "github:gerg-l/spicetify-nix";
  };

  outputs = inputs: {
    homeConfigurations = import ./home inputs;
    nixosConfigurations = import ./nixos inputs;
  };
}
