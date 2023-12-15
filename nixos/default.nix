{ inputs, ... }:

let 
  inherit (inputs) nixpkgs home-manager;

  mkHost = { name, system, modules }: {
    ${name} = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs name; };
      modules = [ ./hosts/${name} ];
    };
  };
in {
  flake.nixosConfigurations = (
    # Personal Laptop
     mkHost {
       name = "thinkpad";
       system = "x86_64-linux";
       modules = [ ];
    }
  );
}
