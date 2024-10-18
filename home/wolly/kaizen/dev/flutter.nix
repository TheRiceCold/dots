{ pkgs, ... }:
{
  # nixpkgs = {
  #   config = {
  #     allowUnfree = true;
  #     android_sdk.accept_license = true;
  #   };
  #   overlays = [
  #     (self: super: {
  #       androidComposition = super.androidenv.composeAndroidPackages {
  #         abiVersions = [ "x86_64" ];
  #       };
  #     })
  #   ];
  # };

  home.packages = with pkgs; [
    jdk
    flutter
    google-chrome
    android-studio
    # androidComposition.androidsdk
  ];
}
