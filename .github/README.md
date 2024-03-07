###### *<div align=right><sub>Last nix update: march, 7, 2024</sub></div>*

<h1 align='center'>
  <img src='https://files.catbox.moe/i4twd5.png' width='115px' />

  Kaizen's Flakes<br />
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

</h1><br />

# ✈️  Overview

### ▶️  Showcase

### 📝 Flake inputs
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

### 🗃️ File Structure
<details>
<summary><b>nixos</b>: Configurations for all hosts. </summary>

> [!NOTE]
> Switch by `cd` to `dots` directory and run `nix-switch <hostname>`.
> OR `doas nixos-rebuild switch --flake .#<hostname>`.

- Shared (Defaults)
  - [bash][bash]: Shell
  - [grub][grub]: Bootloader
  - [pipewire][nixos-shared-services]: Sound server
  - [doas][doas]: Less bloated sudo
  - [podman][nixos-shared-virt]: Containerization tool
  - [jetbrains mono][jetbrains-font]: Typeface Nerd Font

  <details>
    <summary><b>Kaizen</b>: Fully riced configuration that I will continue to improve.</summary>
  </details>
  <details>
    <summary><b>Minimo</b>: Lightweight configuration for the minimalist.</summary>
  </details>
</details>

<details>
<summary><b>home</b>: Home configurations for users and hosts. </summary>

> [!NOTE]
> Switch by `cd` to `dots` directory and run `hm-switch`.
> OR `home-manager switch --flake .`.

- Shared (Defaults)
  - [bash][bash]: Shell
  - [firefox][firefox]: Browser
  - [helix-kai]: Text editor
  - [btop][btop]: System resource monitor
  - [zoxide][zoxide]: Smarter cd command.
  - [bat][bat]: cat but with syntax highlighting (catppuccin)

  <details>
    <summary>Users</summary>
    - wolly (main)
  </details>

</details>

<p align="right"><a href="#top">back to top</a></p>

# 🚀 Installation

### Initial Steps
- Download [NixOS minimal installation](https://nixos.org/download) ISO.
- Boot into the installer.
- Switch to root: `sudo -i`
- Install tools: `nix-shell`

### Commands you should know
- Rebuild and switch to change the system configuration
```
nix-switch 'thinkpad'
```
OR
```
doas nixos-rebuild switch --flake .#thinkpad
```
- Connect to internet (Change what's inside the brackets with your info).
```
iwctl --passphrase <passphrase> station <device> connect <SSID>
```

<p align="right"><a href="#top">back to top</a></p>

## 💐 Acknowledgements

- [Ruixi-rebirth/melted-flakes](Ruixi)
- [Misterio77/nix-config](Misterio77)
- [redyf/nixdots](redyf)

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

<!-- Common Packages -->
[bash]: ../nixos/shared/programs/bash.nix
[home-shared-cli]: ../home/shared/cli/default.nix
[nixos-shared-services]: ../nixos/shared/services.nix
[nixos-shared-virt]: ../nixos/shared/virtualisation.nix

[starship]: ../home/wolly/kaizen/shell/starship.nix

<!-- CLI Packages -->
[yazi]: https://github.com/sxyazi/yazi
[zellij]: ../home/packages/cli/zellij
[fastfetch]: ../home/packages/cli/sysfetch/fastfetch.nix
[onefetch]: ../home/packages/cli/sysfetch/fastfetch.nix
<!-- Games -->
[uchess]: https://github.com/tmountain/uchess
[2048]: https://github.com/alewmoose/2048-in-terminal
[vitetris]: https://github.com/vicgeralds/vitetris

<!-- Desktop Packages -->
[ags-config]: ../home/wolly/kaizen/desktop/ags.nix
[pyprland]: ../home/wolly/kaizen/desktop/hyprland/pypr
[hyprland-config]: ../home/wolly/kaizen/desktop/hyprland
[hyprlock]: ../home/wolly/kaizen/desktop/hyprland/hyprlock

<!-- Apps -->
[helix]: ../home/shared/helix
[firefox]: ../home/shared/firefox
[vscodium]: ../home/wolly/kaizen/vscodium
[foot]: ../home/wolly/kaizen/desktop/apps/foot.nix
[sioyek]: ../home/wolly/kaizen/desktop/apps/sioyek.nix

<!-- Package Links -->
[dwm]: https://dwm.suckless.org
[hyprland]: https://hyprland.org
[ags]: https://aylur.github.io/ags-docs
[kaivim]: https://github.com/thericecold/kaivim
[nixvim]: https://github.com/nix-community/nixvim
[spicetify]: https://github.com/spicetify/spicetify-cli
[inkscape]: https://github.com/inkscape/inkscape
[jetbrains-font]: https://www.jetbrains.com/lp/mono/
[neovim]: https://neovim.io
[grub]: https://www.gnu.org/software/grub
[doas]: https://github.com/slicer69/doas

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
[redyf]: https://github.com/redyf/nixdots
