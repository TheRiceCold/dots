###### *<div align=right><sub>contact: dalewaltergh@gmail.com</sub></div>*

<h1 align='center'>
  <img src='https://files.catbox.moe/i4twd5.png' width='115px' />

  Kaizen's Flakes<br />
  <div align='center'>
    <a href='https://nixos.org'>
      <img src='https://img.shields.io/badge/NixOS-unstable-blue.svg?style=for-the-badge&labelColor=303446&logo=NixOS&logoColor=white&color=91D7E3'>
    </a>
    <a href='https://github.com/kaizen-dw/Flakes/stargazers'>
      <img src='https://img.shields.io/github/stars/kaizen-dw/FLakes?color=F5BDE6&labelColor=303446&style=for-the-badge&logo=starship&logoColor=F5BDE6'>
    </a>
    <a href='https://github.com/kaizen-dw/Flakes'>
      <img src='https://img.shields.io/github/repo-size/kaizen-dw/Flakes?color=C6A0F6&labelColor=303446&style=for-the-badge&logo=github&logoColor=C6A0F6'>
    </a>
    <img src='https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png' width='600px' />
  </div>

  **[<kbd> <br> Overview <br> </kbd>](#-Overview)** 
  **[<kbd> <br> Installation <br> </kbd>](#-Installation)** 
  **[<kbd> <br> Acknowledgements&nbsp; <br> </kbd>](#-Acknowledgements)**

</h1><br />

# 🗃️ Overview

### 📚 Structure
- `flake.nix`: Entrypoint
- `home`: Home-manager configurations
  - `packages`: folder arranged package configurations.
  - `profiles`: Home-manager profiles
    - `kaizen`: Fully featured

- `nixos`: NixOS configurations.
  - `core`: Core configuration
  - `hosts`: Host module configurations
    - `thinkpad`: Lenovo Thinkpad T495 - 16GB RAM, Ryzen 5 3500U
- `pkgs`: exported packages (currently empty)

### 📝 Flake inputs
- [Nix Packages][nixpkgs]: Collection of Nix Packages
- [Home Manager][home-manager]: User environment management using Nix package manager
- [Disko][disko]: Declarative disk partitioning and formatting using Nix
- [Aylur GTK Shell][ags]: A customizable and extensible shell
- [Matugen][matugen]: A material you color generation tool
- [Spicetify Nix][spicetify-nix]: A nix flake for configuring [spicetify].
- [Firefox Addons][firefox-addons]: Firefox addons as packages in [nur] repository
- [Kaivim][kaivim]: an IDE like [Neovim] configuration built with [Nixvim]

### 📦 Packages

- Core packages
  - Shell: [bash][bash]
  - Text Editor: [kaivim][kaivim]
  - Sound Server: [pipewire][pipewire]
  - Syntax Highlighting: [bat][bat]
  - Containerization Tool: [podman][podman]
  - System Resource Monitor: [btop][btop]

</details>

<details>
<summary><b>Home Packages</b></summary><br />

- **Terminal:** [foot][foot]

- **Text Editor & IDEs:** [helix][helix], [vscodium][vscodium] (disabled)

- **CLI Packages**
  - File Manager: [yazi][yazi]
  - Terminal Multiplexer: [zellij][zellij]
  - System Information Tool: [neofetch][neofetch]

- **Display/Desktop Packages:**
  - Window Manager: [hyprland][hyprland]
  - Widgets: [Aylurs Gtk Shell][ags]
  - Wallpaper: [swww][Swww]
  - Browser: [firefox][firefox]

- **Media Packages**
  - Media Player: [mpv][mpv]
  - Image Viewer: [swayimg][swayimg]
  - Audio Control: [pavucontrol][pavucontrol]
  - Audio streaming: [spotify/spicetify][spicetify]

- **Games:**
  - [Celeste Classic][celeste]
  - Terminal: [2048][2048], [chess][uchess], [tetris][vitetris]

- **Other Packages**
  - Game Engine: [godot][godot]
  - Raster Graphics: [krita][krita]
  - 3D Graphics: [blender][blender]
  - Pixel Art Tool: [aseprite][aseprite]
  - Document Viewer: [zathura][zathura]

</details>

<details>
<summary><b>Themes</b></summary>

- Color Scheme: [Catppuccin][Catppuccin]
- Cursor: [Bibata Modern Ice][Bibata-Cursor]
- Icons: [Papirus Dark][Papirus-icon-theme]

</details>

<p align="right"><a href="#top">back to top</a></p>

# 🚀 Installation

### Initial Steps
- Download [NixOS minimal installation](https://nixos.org/download) ISO.
- Boot into the installer.
- Switch to root: `sudo -i`

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

# 💐 Acknowledgements

- [Ruixi-rebirth/melted-flakes](Ruixi)
- [Misterio77/nix-config](Misterio77)
- [redyf/nixdots](redyf)

<!-- Flake Inputs -->
[nixpkgs]: https://github.com/NixOS/nixpkgs/tree/nixpkgs-unstable
[home-manager]: https://github.com/nix-community/disko
[disko]: https://github.com/nix-community/disko
[ags]: https://github.com/aylur/ags
[matugen]: https://github.com/InioX/matugen
[spicetify-nix]: https://github.com/the-argus/spicetify-nix
[spicetify]: https://github.com/spicetify/spicetify-cli
[firefox-addons]: https://gitlab.com/rycee/nur-expressions?dir=pkgs/firefox-addons
[nur]: https://github.com/nix-community/nur-combined
[kaivim]: https://github.com/thecoderice/kaivim
[neovim]: https://github.com/neovim/neovim
[nixvim]: https://github.com/nix-community/nixvim


<!-- Core Packages -->
[ags-config]: ../home/packages/desktop/ags
[Swww]: https://github.com/LGFae/swww
[Hyprland]: ../home/packages/desktop/hyprland
[bash]: ../nixos/core/programs.nix

[zellij]: ../home/packages/cli/zellij
[neofetch]: https://github.com/dylanaraps/neofetch

[bat]: ../home/packages/cli/bat.nix
[pipewire]: ../nixos/core/services.nix
[podman]: ../nixos/core/virtualisation.nix

[foot]: ../home/packages/terminal/foot.nix

[kaivim]: https://github.com/kaizen-dw/kaivim
[firefox]: ../home/packages/desktop/browsers/firefox.nix
[helix]: ../home/packages/dev/editors/helix
[vscodium]: ../home/packages/dev/editors/vscodium

[Bibata-Cursor]: https://github.com/ful1e5/Bibata_Cursor
[Catppuccin]: https://github.com/catppuccin/catppuccin
[Papirus-icon-theme]: https://github.com/PapirusDevelopmentTeam/papirus-icon-theme

[yazi]: https://github.com/sxyazi/yazi

[krita]: https://krita.org/en
[godot]: https://godotengine.org
[blender]: https://www.blender.org
[aseprite]: https://www.aseprite.org
[pavucontrol]: https://github.com/pulseaudio/pavucontrol

[btop]: ../home/packages/cli/btop.nix
[mpv]: ../home/packages/media/default.nix
[Starship]: ../home/packages/shell/starship.nix
[zathura]: ../home/packages/desktop/apps/office/zathura.nix
[sioyek]: ../home/packages/desktop/apps/office/sioyek.nix
[swayimg]: https://github.com/artemsen/swayimg

[celeste]: https://github.com/CelesteClassic
[uchess]: https://github.com/tmountain/uchess
[2048]: https://github.com/alewmoose/2048-in-terminal
[vitetris]: https://github.com/vicgeralds/vitetris

<!-- Acknowledgements -->
[ruixi]: https://github.com/Ruixi-rebirth/flakes
[misterio77]: https://github.com/Misterio77/nix-config
[redyf]: https://github.com/redyf/nixdots
