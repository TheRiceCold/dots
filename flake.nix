{
  description = "Wolly's NixOS Configuration Flakes";

  inputs = {
    nur.url = "github:nix-community/NUR";                         # NUR Packages
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";             # Stable Nix Packages (Default)
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable"; # Unstable Nix Packages

    hyprland = {                                                   # Official Hyprland Flake
      url = "github:hyprwm/Hyprland";                              # Requires "hyprland.nixosModules.default" to be added the host modules
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    home-manager = {                                              # User Environment Manager
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  outputs = inputs @ { self, ... }: {
    nixosConfigurations = (
      import ./hosts { inherit self inputs; }
    );  
  };
}
