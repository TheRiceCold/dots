###### *<div align=right><sub>Last nix update: march 24, 2024</sub></div>*

<h1 align='center'>
  <img src='https://files.catbox.moe/i4twd5.png' width='115px' />

  🦋 ButterflyOS 🦋<br />
  <div align='center'>
    <a href='https://nixos.org'>
      <img src='https://img.shields.io/badge/NixOS-unstable-blue.svg?style=for-the-badge&labelColor=303446&logo=NixOS&logoColor=white&color=91D7E3'>
    </a>
    <a href='https://github.com/TheRiceCold/dot/stargazers'>
      <img src='https://img.shields.io/github/stars/TheRiceCold/dot?color=F5BDE6&labelColor=303446&style=for-the-badge&logo=starship&logoColor=F5BDE6'>
    </a>
    <a href='https://github.com/TheRiceCold/dot'>
      <img src='https://img.shields.io/github/repo-size/TheRiceCold/dot?color=C6A0F6&labelColor=303446&style=for-the-badge&logo=github&logoColor=C6A0F6'>
    </a>
    <img src='https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png' width='600px' />
  </div>

  **[<kbd> <br> Overview <br> </kbd>](#-Overview)** 
  **[<kbd> <br> Installation <br> </kbd>](#-Installation)** 
  **[<kbd> <br> Acknowledgements&nbsp; <br> </kbd>](#-Acknowledgements)**

</h1>

## ✈️  Overview

#### ▶️  Showcase (WIP)

#### 📝 Inputs
- [Nix Packages][nixpkgs]: Collection of Nix Packages.
- [Home Manager][home-manager]: User environment management using Nix package manager.
- [Disko][disko]: Declarative disk partitioning and formatting using Nix.
- [NUR][nur]: Nix User Repositories, user contributed packages.
- [Nix Packages Wayland][nixpkgs-wayland]: Nix packages for Wayland.
- [Pyprland]: Extensions made for [Hyprland].
- [Hyprlock][hyprlock]: GPU-accelerated screen locking utility for [Hyprland].
- [Matugen][matugen]: A material you color generation tool.
- [Aylur GTK Shell][ags]: A customizable and extensible shell.
- [Helix-kai]: A fork of [helix] with some patches applied.
- [Kaivim][kaivim]: an IDE like [Neovim] configuration built with [Nixvim].
- [Spicetify Nix][spicetify-nix]: A nix flake for configuring [spicetify].

<p align="right"><a href="#top">back to top</a></p>

<details>
  <summary> <b>💻 Nixos</b>: configuration for all hosts.</summary>
  <br />

  > To switch host `cd` to `dots` directory and run `nix-switch <hostname>`.

  ---
  - **Shared** (defaults)
    - [bash][bash]: Shell
    - [grub][host-shared]: Bootloader
    - [pipewire][host-shared-services]: Sound server
    - [doas][host-shared]: Less bloated sudo
    - [podman][host-shared-virt]: Containerization tool
    - [jetbrains mono][jetbrains-font]: Typeface Nerd Font
  ---
  - **Kaizen**: Fully riced configuration that I will continue to improve.</summary>
    - [Services][host-kaizen-services]: [Flatpak], Bluetooth Manager
    - [Hardware][host-kaizen]: Bluetooth, [OpenGL], [OpenTabDriver].
    - [Programs][host-kaizen]:
      - [Droidcam][droidcam]: Turns phone camera into a webcam.
      - [virt-manager][virt-man]: GUI tool for managing virtual machines via libvirt.
      - [Hyprland][hyprland]: A highly customizable dynamic tiling wayland compositor.
    - [Virtualisation][host-kaizen]:
      - [libvirt] and [QEMU]
      - [Waydroid][waydroid]: Container-based android system.
  ---
  - **Minimo**: Lightweight configuration for the minimalist.</summary>
    - Window Manager: [dwm]

  <br />
  <p align="right"><a href="#top">back to top</a></p>
</details>
<br />

<details>
  <summary><b>🏠 Home</b>: Home configurations for users and hosts.</summary>
  <br />

  > To switch home by `cd` to `dots` directory and run `hm-switch`.

  ---
  - [**Shared**][home-shared] (defaults)
    - [firefox][firefox]: Browser.
    - [helix-kai]: Text editor.
    - [btop][home-shared-cli]: System resource monitor.
    - [zoxide][home-shared-shell]: Smarter cd command.
    - [bat][home-shared-cli]: Syntax highlighting (catppuccin).
  ---

  - [**Kaizen**][home-kaizen]: Fully riced configuration that I will continue to improve.
    - [CLI][home-kaizen-cli]:
      - [Yazi]: File manager.
      - [Neomutt]: E-mail reader.
      - [Zellij]: Terminal Multiplexer.
      - Other: [eza], [fastfetch], [onefetch]
    - [Desktop][home-kaizen-desktop]:
      - [Apps][home-kaizen-apps]:
        - [foot][foot]: Terminal.
        - [mpv][mpv]: Media player.
        - [sioyek][sioyek]: PDF Viewer.
        - [neovide][neovide]: Neovim GUI client.
        - [spicetify][spicetify]: Customized spotify.
        - [vesktop][vesktop]: Custom discord app.
        - [ncmpcpp][ncmpcpp]: MPD client music player.
        - [vscodium] (disabled): Less bloat vscode.
        - Other: [easyeffects], [krita], [blender], [inkscape], [libresprite] and [godot]
      - [Hyprland][hyprland-config]:
        - [Pyprland][pypr-config] extensions added:
          - [magnify][pypr-magnify]: Toggle magnification (zoom).
          - [scratchpads][pypr-scratch]: Dropdown scratchpads.
        - [Hyprlock][hyprlock-config]: Lockscreen
      - [Theme][home-kaizen-desktop]:
        - Widgets: [kaizen-widgets][ags-config]
        - Icon: [Papirus-Dark][papirus-icon]
        - Font: Ubuntu Nerd Font
        - Cursor: [Bibata-Modern-Ice]
        - GTK: [Catppuccin-Mocha-Compact-Lavender-Dark][gtk-catppuccin]
    - [Shell Scripts][home-kaizen-scripts]:
      - [Colorscripts][home-kaizen-colorscripts]: [blocks][blocks-color], [crunch][crunch-color], [pacman][pacman-color], and [tanks][tanks-color]
  ---
  - [**Minimo**][home-minimo]: (WIP)

  <br /><p align="right"><a href="#top">back to top</a></p>
</details>
<br />

## 🍳 How to cook (Installation)

#### Initial Steps
- Download [NixOS minimal installation](https://nixos.org/download) ISO.
- Boot into the installer.
- Switch to root: `sudo -i`
- Install tools: `nix-shell`

#### Commands you should know
- Rebuild and switch to change the system configuration
```
nix-switch kaizen
```
OR
```
doas nixos-rebuild switch --flake .#minimo
```
- Connect to internet (Change what's inside the brackets with your info).
```
iwctl --passphrase <passphrase> station <device> connect <SSID>
```

<p align="right"><a href="#top">back to top</a></p>

## 💐 Acknowledgements

- [Ruixi-rebirth/melted-flakes](Ruixi) - Inspired me to switch to NixOS
- [Misterio77/nix-config](Misterio77)  - NixOS configuration
- [aylur/dotfiles](aylur) - Desktop environment
- [nawfalmrouyan/hyprland](newfalmrouyan) - Hyprland WM

<!-- Flake Inputs -->
[nixpkgs]: https://github.com/NixOS/nixpkgs/tree/nixpkgs-unstable
[disko]: https://github.com/nix-community/disko
[home-manager]: https://github.com/nix-community/disko
[nur]: https://github.com/nix-community/NUR
[nixpkgs-wayland]: https://github.com/nix-community/nixpkgs-wayland
[ags]: https://github.com/aylur/ags
[matugen]: https://github.com/InioX/matugen
[hyprlock]: https://github.com/hyprwm/hyprlock
[kaivim]: https://github.com/thericecold/kaivim
[helix-kai]: https://github.com/thericecold/helix-kai
[spicetify-nix]: https://github.com/the-argus/spicetify-nix

<!-- Nixos Shared -->
[bash]: ../nixos/shared/programs/bash.nix
[host-shared]: ../nixos/shared/default.nix
[home-shared-cli]: ../home/shared/cli/default.nix
[home-shared-shell]: ../home/shared/shell/default.nix
[host-shared-services]: ../nixos/shared/services.nix
[host-shared-virt]: ../nixos/shared/virtualisation.nix

[host-kaizen]: ../nixos/hosts/kaizen/default.nix
[host-kaizen-services]: ../nixos/hosts/kaizen/services.nix

[starship]: ../home/wolly/kaizen/shell/starship.nix

<!-- Home -->
[home-shared]: ../home/shared/default.nix
[home-kaizen]: ../home/wolly/kaizen/default.nix
[home-kaizen-cli]: ../home/wolly/kaizen/cli/default.nix
[home-kaizen-desktop]: ../home/wolly/kaizen/dekstop/default.nix
[home-kaizen-scripts]: ../home/wolly/kaizen/scripts//default.nix
[home-kaizen-apps]: ../home/wolly/kaizen/dekstop/apps/default.nix

<!-- Hyprland Configurations -->
[hyprland-config]: ../home/wolly/kaizen/desktop/hyprland
[hyprlock-config]: ../home/wolly/kaizen/desktop/hyprland/hyprlock/default.nix
[pypr-config]: ../home/wolly/kaizen/desktop/hyprland/pypr/default.nix
[pypr-magnify]: https://github.com/hyprland-community/pyprland/wiki/magnify
[pypr-scratch]: https://github.com/hyprland-community/pyprland/wiki/scratchpads


<!-- Color Scripts -->
[home-kaizen-colorscripts]: ../home/wolly/kaizen/scripts/colors/default.nix
[blocks-color]: ../home/wolly/kaizen/scripts/colors/blocks.nix
[crunch-color]: ../home/wolly/kaizen/scripts/colors/crunch.nix
[pacman-color]: ../home/wolly/kaizen/scripts/colors/pacman.nix
[tanks-color]: ../home/wolly/kaizen/scripts/colors/tanks.nix

<!-- Theme -->
[papirus-icon]: https://github.com/PapirusDevelopmentTeam/papirus-icon-theme
[bibata-modern-ice]: https://github.com/ful1e5/Bibata_Cursor
[gtk-catppuccin]: https://github.com/catppuccin/gtk

<!-- CLI Packages -->
[zellij]: ../home/packages/cli/zellij
[fastfetch]: ../home/packages/cli/sysfetch/fastfetch.nix
[onefetch]: ../home/packages/cli/sysfetch/fastfetch.nix
<!-- Games -->
[uchess]: https://github.com/tmountain/uchess
[2048]: https://github.com/alewmoose/2048-in-terminal
[vitetris]: https://github.com/vicgeralds/vitetris

<!-- Desktop Packages -->
[pyprland]: ../home/wolly/kaizen/desktop/hyprland/pypr
[home-minimo]: ../home/wolly/minimo/default.nix
[kaizen-widgets]: https://github.com/TheRiceCode/kaizen-widgets


<!-- Apps -->
[helix]: ../home/shared/helix
[firefox]: ../home/shared/firefox
[vscodium]: ../home/wolly/kaizen/vscodium
[foot]: ../home/wolly/kaizen/desktop/apps/foot.nix
[sioyek]: ../home/wolly/kaizen/desktop/apps/sioyek.nix

<!-- Package Links -->
[mpv]: https://mpv.io
[ncmpcpp]: https://github.com/ncmpcpp/ncmpcpp
[easyeffects]: https://github.com/wwmm/easyeffects
[libresprite]: https://libresprite.github.io
[neovide]: https://neovide.dev
[dwm]: https://dwm.suckless.org
[hyprland]: https://hyprland.org
[opengl]: https://www.opengl.org
[nixvim]: https://github.com/nix-community/nixvim
[spicetify]: https://github.com/spicetify/spicetify-cli
[vesktop]: https://github.com/Vencord/Vesktop
[inkscape]: https://github.com/inkscape/inkscape
[jetbrains-font]: https://www.jetbrains.com/lp/mono
[neomutt]: https://neomutt.org
[eza]: https://github.com/eza-community/eza
[neovim]: https://neovim.io
[flatpak]: https://flatpak.org
[virt-man]: https://virt-manager.org
[droidcam]: https://droidcam.app
[OpenTabDriver]: https://opentabletdriver.net
[yazi]: https://github.com/sxyazi/yazi
[libvirt]: https://libvirt.org
[qemu]: https://www.qemu.org
[waydroid]: https://waydro.id/

[godot]: https://godotengine.org
[krita]: https://krita.org/en
[blender]: https://www.blender.org
[aseprite]: https://www.aseprite.org

<!-- Themes -->
[Bibata-Cursor]: https://github.com/ful1e5/Bibata_Cursor
[Catppuccin]: https://github.com/catppuccin/catppuccin
[Papirus-icon-theme]: https://github.com/PapirusDevelopmentTeam/papirus-icon-theme

<!-- Fonts -->
[nerdfonts]: https://www.nerdfonts.com/
[fontawesome]: https://fontawesome.com/

<!-- Acknowledgements -->
[ruixi]: https://github.com/Ruixi-rebirth/flakes
[misterio77]: https://github.com/Misterio77/nix-config
[aylur]: https://github.com/aylur/dotfiles
[nawfalmrouyan]: https://github.com/nawfalmrouyan/hyprland
