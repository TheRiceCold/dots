{
  description = "My Configuration Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    disko.url = "github:nix-community/disko";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # sops-nix.url = "github:mic92/sops-nix"; # TODO: Implement this

    nur.url = "github:nix-community/NUR";
    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";

    helix-kai.url = "github:thericecold/helix-kai";

    # Kaizen Inputs
    ags.url = "github:aylur/ags";
    # astal.url = "github:Aylur/astal";
    matugen.url = "github:iniox/matugen";
    hyprlock.url = "github:hyprwm/hyprlock";
    pyprland.url = "github:hyprland-community/pyprland";

    kaivim.url = "github:thericecold/kaivim";
    spicetify-nix.url = "github:the-argus/spicetify-nix";
 };

  outputs = inputs @ { ... }: {
    homeConfigurations = import ./home { inherit inputs; };
    nixosConfigurations = import ./nixos { inherit inputs; };
  };

  nixConfig = { };
}
