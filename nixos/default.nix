{ inputs, ... }:

let 
  inherit (inputs.nixpkgs.lib) nixosSystem;

  mkHost = { name, system, modules }: {
    ${name} = nixosSystem {
      inherit system;
      specialArgs = { inherit inputs name; };
      modules = [ ./hosts/${name} ];
    };
  };
in (
  # Personal Laptop
   mkHost {
     name = "thinkpad";
     system = "x86_64-linux";
     modules = [ ];
  }
)
