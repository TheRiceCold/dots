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
      "adbusers"
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
      # blender         # 3D Creation/Animation System
      # helix
      # scrcpy          # Display and control Android devices over USB or TCP/IP
      audacity
      starship
      obs-studio
      firefox-wayland
      # libsForQt5.kdenlive
    ]);
  };
}
