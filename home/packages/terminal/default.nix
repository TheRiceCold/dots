{
  imports = [ ./kitty ];

  programs = {
    foot = import ./foot.nix;
  };
}
