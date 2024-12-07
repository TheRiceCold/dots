{  user, stateVersion, ... }: {
  imports = [
    ./cli
    ./firefox
    ./qutebrowser
  ];

  home = {
    username = user;
    inherit stateVersion;
    homeDirectory = "/home/${user}";
  };
}
