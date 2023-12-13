{ ... }:

let

in {
  imports = [ 
    ./hosts    
    # ./home
  ]; # { # inherit user; };

  # flake = {
  #   nixosConfigurations = (
  #     # Personal Laptop
  #     mkHost {
  #       name = "thinkpad";
  #       system = "x86_64-linux";
  #       modules = [ ];
  #     }
  #   );

  #   homeConfigurations = (
  #     mkHome { name = "dale@thinkpad"; }
  #     mkHome { name = "wolly@thinkpad"; }
  #   );
  # };
}
