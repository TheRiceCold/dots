{
  description = "My Configuration Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-23.11";

    lanzaboote.url = "github:nix-community/lanzaboote";
    home-manager.url = "github:nix-community/home-manager/release-23.11";

    flake-parts.url = "github:hercules-ci/flake-parts";
  };
  
  outputs = inputs @ { flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ ./nixos ];
      systems = [ "x86_64-linux" ];
    };

  # nixConfig.trusted-users = [ "root" "@wheel" ];
}
