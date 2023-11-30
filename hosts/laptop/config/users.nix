{ user, pkgs, unstable, ... }:

let
in {
  users.users.${user} = {
    isNormalUser = true;
    initialPassword = "password";

    extraGroups = [ 
      "networkmanager" 
      "wheel" 
      "video" 
      "audio" 
      "camera" 
      "podman"
      "libvirtd" 
      "qemu-libvirtd" 
    ];

    packages = with pkgs; [
      mpv             # Media Player
      axel            # CLI download accelerator
      kitty           # Terminal Emulator

      zathura         # PDF Viewer
      qemu_kvm        # 

      pavucontrol     # Audio Control

      podman          # Docker Alternative
      kubectl         # Kubernetes CLI

      zoxide          #
      direnv          # A shell extension that manages your environment

      # postman
      # dbeaver

      # ventoy          # Multi Boot USB Solution
      # transmission    # BitTorrent client
      # cool-retro-term
    ] ++ (with unstable; [
      # emacs
      # scrcpy          #
      # blender         # 3D Creation/Animation System
      tor-browser     # Privacy-focused browser routing traffic through the Tor network
      google-chrome   # Browser
    ]);
  };
}
