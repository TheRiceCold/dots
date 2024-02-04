{
  description = "My Configuration Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    ags.url = "github:Aylur/ags";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
 };
  
  outputs = inputs @ { ... }: {
    # packages = import ./pkgs;
    homeConfigurations = import ./home { inherit inputs; };
    nixosConfigurations = import ./nixos { inherit inputs; };
  };

  nixConfig = { };
}
