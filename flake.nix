{
  description = "My Configuration Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    # nixt.url = "github:nix-community/nixt";
    disko.url = "github:nix-community/disko";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # pkgs overlay in home/packages/default.nix
    nur.url = "github:nix-community/NUR";
    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";

    hyprland-contrib.url = "github:hyprwm/contrib";

    ags.url = "github:aylur/ags";
    matugen.url = "github:iniox/matugen";
    hyprlock.url = "github:hyprwm/hyprlock";
    # sops-nix.url = "github:mic92/sops-nix";

    kaivim.url = "github:thericecold/kaivim";
    spicetify-nix.url = "github:the-argus/spicetify-nix";
 };

  outputs = inputs @ { ... }: {
    homeConfigurations = import ./home { inherit inputs; };
    nixosConfigurations = import ./nixos { inherit inputs; };
  };

  nixConfig = { };
}
