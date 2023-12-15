{
  description = "My Configuration Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-23.11";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    flake-parts.url = "github:hercules-ci/flake-parts";
 };
  
  outputs = inputs @ { flake-parts, ... }: 
    flake-parts.lib.mkFlake { inherit inputs; } {  
      imports = [ ./home ./nixos ];
      systems = [ "x86-64_linux" ];
    };

  # nixConfig.trusted-users = [ "root" "@wheel" ];
}
