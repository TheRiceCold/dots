{ inputs, ... }:

let 
  inherit (inputs.nixpkgs.lib) nixosSystem;

  mkHost = { name, system, stateVersion, modules }: {
    ${name} = nixosSystem {
      inherit system;
      modules = [ ./core ./hosts/${name} ] ++ modules;
      specialArgs = { inherit inputs name stateVersion; };
    };
  };
in (
  # Personal Laptop (Thinkpad T495)
   mkHost {
    name = "thinkpad";
    stateVersion = "23.11";
    system = "x86_64-linux";
    modules = [ ./common ];
  }
)
