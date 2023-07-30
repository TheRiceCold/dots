{
  # OUTPUTS
  outputs = inputs @ { self, nixpkgs, flake-parts, ... }:
    let
      selfPkgs = import ./pkgs;
    in
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];

      imports = [
        # To import a flake module
        # 1. Add foo to inputs
        # 2. Add foo as a parameter to the outputs function
        # 3. Add here: foo.flakeModule
      ];

      perSystem = { pkgs, system, ... }: 
        let
          pkgs = import nixpkgs {
            inherit system;
            overlays = [
              self.overlays.default
            ];
          };
        in
        {
          # Per-system attributes can be defined here. The self' and inputs'
          # module parameters provide easy access to attributes of the same
          # system.

          # Equivalent to  inputs'.nixpkgs.legacyPackages.hello;
        };

      flake = {
        overlays.default = selfPkgs.overlay;
        nixosConfigurations = (
          import ./hosts {
            inherit nixpkgs self inputs;
          }
        );  
      };
    };

  # INPUTS
  inputs = {
    nixpkgs.url       = "github:nixos/nixpkgs/nixos-unstable";  # Nix Packages
    nur.url           = "github:nix-community/NUR";             # NUR Packages

    hyprpicker.url    = "github:hyprwm/hyprpicker";             # Hyprpicker
    hyprland.url      = "github:hyprwm/Hyprland";               # Hyprland

    home-manager = {                                            # Home Manager
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    joshuto.url = "github:kamiyaa/joshuto";

    flake-parts.url = "github:hercules-ci/flake-parts";         # Flake Parts
  };
}
