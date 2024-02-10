{
  imports = [
    # ./sioyek.nix
  ];

  programs = {
    zathura = import ./zathura.nix;
  };
}
