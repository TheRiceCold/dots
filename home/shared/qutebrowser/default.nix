{ pkgs, ... }: {
  programs.qutebrowser = {
    enable = true;
    settings = import ./settings.nix;
    searchEngines = import ./searchEngines.nix;
    quickmarks = import ./quickmarks.nix;
    greasemonkey = import ./greasemonkey.nix pkgs;
  };
}
