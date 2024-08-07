###### _<div align=right><sub>Last nix update: July 05, 2024</sub></div>_

<div align=center>
  <h1>Nix dots</h1>
  <a style='margin-right: 4px;' href=https://nixos.org>
    <img src='https://img.shields.io/badge/NixOS-unstable-blue.svg?style=for-the-badge&labelColor=1b1e28&logo=NixOS&logoColor=add7ff&color=add7ff'>
  </a>
  <a style='margin-right: 4px;' href=https://github.com/thericecold/dots>
    <img src='https://img.shields.io/github/languages/code-size/thericecold/dots?color=5de4c7&labelColor=1b1e28&style=for-the-badge&logo=github&logoColor=5de4c7'>
  </a>
  <a style='margin-right: 4px;' href=https://github.com/thericecold/dots/stargazers>
    <img src='https://img.shields.io/github/stars/thericecold/dots?color=fcc5e9&labelColor=1b1e28&style=for-the-badge&logo=starship&logoColor=fcc5e9'>
  </a> <br /> <br />

**[<kbd> <br> Overview <br> </kbd>](#-overview)** 
**[<kbd> <br> Installation <br> </kbd>](#-how-to-cook-installation)** 
**[<kbd> <br> Commands&nbsp;<br> </kbd>](#-shell-commands)** 
**[<kbd> <br> Acknowledgements&nbsp; <br> </kbd>](#-Acknowledgements)**

<details>
  <summary><h3 style='display: inline;'>Showcase</h3></summary>

#### 💻 Desktop

https://github.com/TheRiceCold/kaizen/assets/44263259/4c3e38e9-320c-4d7a-968a-509b556e1ac2

<details>
<summary><b>View details</b></summary>

Window Manager: [Hyprland]<br/>
Desktop Environment: [Kaizen]

</details>

#### 👨‍💻 Development Setup

<img src='https://github.com/thericecold/dots/blob/main/assets/screenshots/neovim.png' />
<details>
  <summary><b>View details</b></summary>

Text editor: [Kaivim]<br/>
Terminal Multiplexer: [Zellij]<br/>
Scratchpad: [Pyprland's scratchpad][pyprland]

</details>

#### 🗃️ Archived but still cool

[Hyprlock][hyprlock-config]

  <img src='https://github.com/thericecold/dots/blob/main/assets/screenshots/lockscreen.jpg' />

<p align=right><a href='#top'>back to top</a></p>
</details>

</div>

> [!NOTE]
> This is my personal configuration for my setup.
> If something doesn't work, feel free to open up an issue or message me.

## ❄️ Flake Overview

#### Inputs

- [Nix Packages][nixpkgs]: Collection of Nix Packages.
- [Home Manager][home-manager]: User environment management using Nix package manager.
- [Disko][disko]: Declarative disk partitioning and formatting using Nix.
- [Sops Nix][sops-nix]: Atomic, declarative, and reproducible secret provisioning for NixOS based on sops.
- [NUR][nur]: Nix User Repositories, user contributed packages.
- [Nix Packages Wayland][nixpkgs-wayland]: Nix packages for Wayland.
- [Kaizen][kaizen]: Desktop environment I configured using [Ags].
- [Kaivim][kaivim]: Personal [Neovim] configuration built with [Nixvim].
- [Spicetify Nix][spicetify-nix]: A nix flake for configuring [Spicetify].

#### Outputs

<details>
  <summary><b>💻 Nixos</b>: configuration for all hosts.</summary>
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
    <p align=right><a href='#top'>back to top</a></p>
  </details>
  <details>
    <summary><b>🏠 Home</b>: Home configurations for users and hosts.</summary>
    <br />

> To switch home by `cd` to `dots` directory and run `hm-switch`.

---

- [**Shared**][home-shared] (defaults)
  - [firefox][firefox]: Browser
  - [helix]: Text Editor
  - [zoxide][home-shared-shell]: Smarter cd command
  - [btop][home-shared-cli]: System resource monitor
  - [bat][home-shared-cli]: Syntax highlighting (catppuccin)

---

- [**Kaizen**][home-kaizen]: Fully riced configuration that I will continue to improve
  - Desktop: [Kaizen]
    - Cursor: [Bibata-Modern-Ice]
    - GTK Theme: [Matcha-gtk-theme]
    - Window Manager: [Hyprland][hyprland-config]
      - [Pyprland][pypr-config]: Scratchpads and magnify.
      - [Hypridle][hypridle-config]: Idle management
      - [Hyprshade][hyprshade-config]: Shader configuration tool
  - [Terminal Applications][home-kaizen-cli]
    - [Zellij][zellij-config]: Multiplexer
    - [Yazi]: File Manager
    - [Curlie]: httpie-like curl
    - [Neomutt]: E-mail Reader
    - [Slides]: Presentation Tool
    - Utilities: [eza], [fastfetch][fastfetch-config], [onefetch][onefetch-config]
    - Games: [tetris][vitetris], [uchess], [toipe]
    - Other: [pipes][pipes-rs], [krabby]
  - [Desktop Applications][home-kaizen-apps]
    - [foot][foot]: Terminal
    - [mpv][mpv]: Media player
    - [sioyek][sioyek]: PDF Viewer
    - [neovide][neovide]: Neovim GUI client
    - [spicetify][spicetify]: Customized spotify
    - [vesktop][vesktop]: Custom discord app
    - [ncmpcpp][ncmpcpp]: MPD client music player
    - [vscodium] (disabled): Less bloat vscode
    - Other: [easyeffects], [krita], [blender], [inkscape], [libresprite] and [godot]
  - [Shell Scripts][home-kaizen-scripts]:
    - [Colorscripts][home-kaizen-colorscripts]: [blocks][blocks-color], [crunch][crunch-color], [pacman][pacman-color], and [tanks][tanks-color]

---

- [**Minimo**][home-minimo]: (WIP)

</details>
<p align=right><a href='#top'>back to top</a></p>

## 🫕 How to cook (Installation)

#### Initial Steps

- Download [NixOS minimal installation](https://nixos.org/download) ISO.
- Boot into the installer.
- Switch to root: `sudo -i`
- Install utility packages: `nix-shell`

### Quick Installation

- Connecting to Wi-Fi.

```
iwctl --passphrase <passphrase> station <device> connect <SSID>
```

- Clone repo: `git clone https://github.com/thericecold/dots`
- Generate configuration : nixos-generate-config --root /mnt
- Copy hardware configuration:

```
  cp /mnt/etc/nixos/hardware-configuration.nix /mnt/etc/nixos/nixos-config/hosts/<host>
```

- Nixos Install: `nixos-install --flake kaizen`
- Home Manager: `hm-switch`

<p align=right><a href='#top'>back to top</a></p>

## 🧑‍💻 Shell Commands
  #### Aliases
  - `x`: exit
  - `v`: nvim
  - `f`: fuck
  - `c`: clear
  - `np`: nix profile
  - `hm`: home-manager
  - `nix-up`: doas nix flake update
  - `hm-switch`: git add . ; nh home switch
  - `nix-rollback`: doas nixos-rebuild switch --rollback
---

#### Functions

- Update an input included in [flake.nix](../flake.nix) file.
```
nix-up-input <input> # Example: nix-update-input nixpkgs
```
- Upgrade a nix profile.
> NOTE: run `nix profile list` to see the profile index
```
nix-upgrade <index> # Example: nix-upgrade 3
```
- Rebuild switch a NixOS host.
> NOTE: There are only two host; `kaizen` and `minimo`
```
nix-switch <hostname> # Example: nix-switch kaizen
```
- Cleanup and rebuild switch a NixOS host.
```
nix-clean-switch <hostname> # Example: nix-clean-switch kaizen
```
- Update flake inputs and rebuild switch a NixOS host.
```
nix-up-switch <hostname> # Example: nix-up-switch kaizen
```
- Cleanup, update flake inputs and rebuild switch a NixOS host.
```
nix-full-switch <hostname> # Example: nix-full-switch kaizen
```
- Install a package/profile from [Nix packages](https://search.nixos.org/packages).
```
nixpkgs-add <package> # Example: nixpkgs-add firefox
```
- Install a nix flake github repository.
```
nixgit-add <username/repository> # Example: nixgit-add thericecold/kaivim
```

<p align=right><a href='#top'>back to top</a></p>

## 🙏 Acknowledgements

- [Misterio77/nix-config](Misterio77) - To properly write configuration.
- [Ruixi-rebirth/melted-flakes](Ruixi) - Inspired me to switch to NixOS.

<!-- Flake Inputs -->

[nixpkgs]: https://github.com/NixOS/nixpkgs/tree/nixpkgs-unstable
[home-manager]: https://github.com/nix-community/disko
[disko]: https://github.com/nix-community/disko
[sops-nix]: https://github.com/Mic92/sops-nix
[nur]: https://github.com/nix-community/NUR
[nixpkgs-wayland]: https://github.com/nix-community/nixpkgs-wayland
[kaivim]: https://github.com/thericecold/kaivim
[kaizen]: https://github.com/thericecold/kaizen
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
[home-minimo]: ../home/wolly/minimo/default.nix
[home-kaizen]: ../home/wolly/kaizen/default.nix
[home-kaizen-cli]: ../home/wolly/kaizen/cli/default.nix
[home-kaizen-desktop]: ../home/wolly/kaizen/dekstop/default.nix
[home-kaizen-scripts]: ../home/wolly/kaizen/scripts//default.nix
[home-kaizen-apps]: ../home/wolly/kaizen/dekstop/apps/default.nix

<!-- Hyprland Configurations -->

[hyprland-config]: ../home/wolly/kaizen/desktop/wayland/hyprland
[pypr-config]: ../home/wolly/kaizen/desktop/wayland/hyprland/pypr/default.nix
[hypridle-config]: ../home/wolly/kaizen/desktop/wayland/hyprland/ecosystem/hypridle.nix
[hyprshade-config]: ../home/wolly/kaizen/desktop/wayland/hyprland/ecosystem/hyprshade.nix
[hyprlock-config]: ../home/wolly/kaizen/desktop/wayland/hyprland/ecosystem/hyprlock/default.nix

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
[matcha-gtk-theme]: https://github.com/vinceliuice/Matcha-gtk-theme

<!-- Apps -->

[helix]: ../home/shared/helix
[firefox]: ../home/shared/firefox
[vscodium]: ../home/wolly/kaizen/vscodium
[foot]: ../home/wolly/kaizen/desktop/apps/foot.nix
[sioyek]: ../home/wolly/kaizen/desktop/apps/sioyek.nix

<!-- GitHub Links -->

[ags]: https://github.com/aylur/ags
[curlie]: https://github.com/rs/curlie
[yazi]: https://github.com/sxyazi/yazi
[toipe]: https://github.com/Samyak2/toipe
[krabby]: https://github.com/yannjor/krabby
[eza]: https://github.com/eza-community/eza
[pipes-rs]: https://github.com/lhvy/pipes-rs
[uchess]: https://github.com/tmountain/uchess
[vesktop]: https://github.com/Vencord/Vesktop
[slides]: https://github.com/maaslalani/slides
[hyprlock]: https://github.com/hyprwm/hyprlock
[inkscape]: https://github.com/inkscape/inkscape
[nixvim]: https://github.com/nix-community/nixvim
[vitetris]: https://github.com/vicgeralds/vitetris
[spicetify]: https://github.com/spicetify/spicetify-cli
[pyprland]: https://github.com/hyprland-community/pyprland
[pypr-magnify]: https://github.com/hyprland-community/pyprland/wiki/magnify
[pypr-scratch]: https://github.com/hyprland-community/pyprland/wiki/scratchpads

<!-- Package Links -->

[mpv]: https://mpv.io
[neovim]: https://neovim.io
[qemu]: https://www.qemu.org
[waydroid]: https://waydro.id
[flatpak]: https://flatpak.org
[libvirt]: https://libvirt.org
[neovide]: https://neovide.dev
[krita]: https://krita.org/en
[neomutt]: https://neomutt.org
[dwm]: https://dwm.suckless.org
[godot]: https://godotengine.org
[opengl]: https://www.opengl.org
[droidcam]: https://droidcam.app
[hyprland]: https://hyprland.org
[blender]: https://www.blender.org
[aseprite]: https://www.aseprite.org
[virt-man]: https://virt-manager.org
[nerdfonts]: https://www.nerdfonts.com
[fontawesome]: https://fontawesome.com
[libresprite]: https://libresprite.github.io
[ncmpcpp]: https://github.com/ncmpcpp/ncmpcpp
[OpenTabDriver]: https://opentabletdriver.net
[easyeffects]: https://github.com/wwmm/easyeffects
[jetbrains-font]: https://www.jetbrains.com/lp/mono

[zellij-config]: ../home/wolly/kaizen/cli/zellij
[onefetch-config]: ../home/wolly/kaizen/cli/sysfetch/onefetch.nix
[fastfetch-config]: ../home/wolly/kaizen/cli/sysfetch/fastfetch.nix

<!-- Acknowledgements -->

[ruixi]: https://github.com/Ruixi-rebirth/flakes
[misterio77]: https://github.com/Misterio77/nix-config
