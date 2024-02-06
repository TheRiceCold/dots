{ pkgs, ... }:

{
  home.packages = with pkgs; [kubectl kubernetes-helm];
  programs.k9s.enable = true;
}
