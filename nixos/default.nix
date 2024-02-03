{ inputs, ... }:

let 
  inherit (inputs.nixpkgs.lib) nixosSystem;

  mkHost = { name, system }: {
    ${name} = nixosSystem {
      inherit system;
      modules = [ ./hosts/${name} ./core ];
      specialArgs = { inherit inputs name; };
    };
  };
in (
  # Personal Laptop
   mkHost {
    name = "thinkpad";
    system = "x86_64-linux";
  }
)
