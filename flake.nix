{
  description = "My Configuration Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    disko.url = "github:nix-community/disko";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # pkgs overlay at home/shared/default.nix
    nur.url = "github:nix-community/NUR";
    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";

    ags.url = "github:aylur/ags";
    matugen.url = "github:iniox/matugen";
    hyprlock.url = "github:hyprwm/hyprlock";
    # sops-nix.url = "github:mic92/sops-nix"; # TODO: Implement this

    kaivim.url = "github:thericecold/kaivim";
    helix-kai.url = "github:thericecold/helix-kai";
    spicetify-nix.url = "github:the-argus/spicetify-nix";
 };

  outputs = inputs @ { ... }: {
    homeConfigurations = import ./home { inherit inputs; };
    nixosConfigurations = import ./nixos { inherit inputs; };
  };

  nixConfig = { };
}
