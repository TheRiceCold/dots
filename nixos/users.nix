{ user, pkgs, unstable, ... }:

{
  users.users.${user} = {
    isNormalUser = true;
    initialPassword = "password";

    extraGroups = [ 
      "networkmanager" 
      "wheel" 
      "video" 
      "audio" 
      "camera" 
      "adbusers"
    ];

    packages = with pkgs; [
      mpv             # Media Player
      axel            # CLI download accelerator
      # kitty           # Terminal Emulator
      foot            # Lightweight Terminal Emulator 

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
    ] ++ (with unstable; [
      # blender         # 3D Creation/Animation System
      # scrcpy          # Display and control Android devices over USB or TCP/IP
      # libsForQt5.kdenlive
      # audacity
      starship
      # obs-studio
      firefox-wayland

      # Scripting Languages
      ruby
      nodejs
      python3
    ]);
  };
}
