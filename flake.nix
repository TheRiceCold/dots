{
  description = "My Configuration Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix.url = "github:mic92/sops-nix"; # TODO: Implement this
    disko.url = "github:nix-community/disko";

    nur.url = "github:nix-community/NUR";
    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";

    kaizen.url = "github:thericecold/kaizen";
    kaivim.url = "github:thericecold/kaivim";
    tmux-sessionx.url = "github:omerxx/tmux-sessionx";
    spicetify-nix.url = "github:gerg-l/spicetify-nix";
  };

  outputs = inputs @ {...}: {
    homeConfigurations = import ./home inputs;
    nixosConfigurations = import ./nixos inputs;
  };

  nixConfig = {};
}
