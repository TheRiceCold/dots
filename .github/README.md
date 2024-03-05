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
  **[<kbd> <br>&nbsp;Packages&nbsp;<br> </kbd>](#-Packages)** 
  **[<kbd> <br> Installation <br> </kbd>](#-Installation)** 
  **[<kbd> <br> Acknowledgements&nbsp; <br> </kbd>](#-Acknowledgements)**

</h1><br />

# 🗃️ Overview

### 📚 Structure
- `flake.nix`: Entrypoint
- `home`: Home-manager configurations
  - `packages`: folder arranged package configurations.
  - `profiles`: Home-manager profiles
    - `kaizen`: Profile for continuous improvement
  - `scripts`: Written shell script bin
    - `colors`: Nice looking colorscripts

- `nixos`: NixOS configurations.
  - `core`: Core configuration
  - `hosts`: Host module configurations
    - `thinkpad`: Lenovo Thinkpad T495 - 16GB RAM, Ryzen 5 3500U
- `pkgs`: exported packages (currently empty)

### 📝 Flake inputs
- [Nix Packages][nixpkgs]: Collection of Nix Packages.
- [Disko][disko]: Declarative disk partitioning and formatting using Nix.
- [Home Manager][home-manager]: User environment management using Nix package manager.
- [NUR][nur]: Nix User Repositories, user contributed packages.
- [Nix Packages Wayland][nixpkgs-wayland]: Packages for Wayland.
- [Aylur GTK Shell][ags]: A customizable and extensible shell.
- [Matugen][matugen]: A material you color generation tool.
- [Hyprlock][hyprlock]: GPU-accelerated screen locking utility for [Hyprland].
- [Kaivim][kaivim]: an IDE like [Neovim] configuration built with [Nixvim].
- [Spicetify Nix][spicetify-nix]: A nix flake for configuring [spicetify].

<p align="right"><a href="#top">back to top</a></p>

# 📦 Packages

- Common packages and services
  - Shell: [bash][bash]
  - Text Editor: [kaivim][kaivim]
  - Sound Server: [pipewire][pipewire]
  - Containerization Tool: [podman][podman]
  - System Resource Monitor: [btop][btop]
  - Others: [Flatpak][flatpak], [thefuck][thefuck], [fzf][fzf], [bat][bat]

</details>

<details>
<summary><b>Home Packages</b></summary><br />

- **Shell Packages**: [nushell]
  - [starship]: Shell prompt
  -

- **CLI Packages**
  - File Manager: [yazi]
  - Terminal Multiplexer: [zellij]
  - Games: [2048][2048], [chess][uchess], [tetris][vitetris]
  - System Information Tools: [fastfetch], [onefetch]

- **Display/Desktop Packages:**
  - Window Manager: [Hyprland]
    - Lockscreen: [Hyprlock]
    - Plugins: [Pyprland]: scratchpads, zoom

  - Widgets: [Aylurs Gtk Shell][ags]
  - Applications:
    - Browser: [firefox]
    - Graphics Editors:
      - [Blender]: 3D graphics
      - [Krita]: Raster graphics
      - [Aseprite]: Pixel art tool
      - [Inkscape]: Vector graphics
    - Media players/Audio streaming: [mpv] & [Spotify][spicetify]
  - Productivity Tools:
      - [sioyek] & [zathura] (disabled): PDF viewer
  - Terminal: [foot][foot] & [wezterm][wezterm] (disabled)

- **Developers Packages**
  - Game Engine: [godot]
  - Text Editor & IDEs: [helix], [vscodium] (disabled)

</details>

<details>
<summary><b>Themes</b></summary>

- Color Scheme: [Catppuccin]
- Cursor: [Bibata Modern Ice][Bibata-Cursor]
- Icons: [Papirus Dark][Papirus-icon-theme]

</details>

<details>
<summary><b>Fonts</b></summary>

- [FontAwesome]
- [Nerd Fonts][nerdfonts]: JetBrains Mono, Ubuntu, UbuntuMono, FiraCode, Monoki

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

# 💐 Acknowledgements

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
[spicetify-nix]: https://github.com/the-argus/spicetify-nix

<!-- Common Packages -->
[bash]: ../nixos/common/bash.nix
[btop]: ../home/packages/cli/default.nix
[pipewire]: ../nixos/core/services.nix
[podman]: ../nixos/core/virtualisation.nix
[flatpak]: ../home/packages/cli/default.nix
[thefuck]: ../home/packages/cli/default.nix
[fzf]: ../home/packages/cli/default.nix
[bat]: ../home/packages/cli/bat.nix

<!-- Shell Packages -->
[nushell]: ../home/packages/shell/nushell.nix
[Starship]: ../home/packages/shell/starship.nix

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
<!-- Hyprland Packages/Plugins -->
[hyprland]: ../home/packages/desktop/hyprland
[pyprland]: ../home/packages/desktop/hyprland/pypr
[hyprlock]: ../home/packages/desktop/hyprland/hyprlock

<!-- Widgets -->
[ags-config]: ../home/packages/desktop/ags

<!-- Browser -->
[firefox]: ../home/packages/desktop/browsers/firefox

<!-- Graphics -->
[inkscape]: https://github.com/inkscape/inkscape
[krita]: https://krita.org/en
[blender]: https://www.blender.org
[aseprite]: https://www.aseprite.org
<!-- Productivity -->
[zathura]: ../home/packages/desktop/apps/productivity/zathura.nix
[sioyek]: ../home/packages/desktop/apps/productivity/sioyek.nix
<!-- Media -->
[mpv]: ../home/packages/desktop/apps/media/default.nix
[spicetify]: https://github.com/spicetify/spicetify-cli

<!-- Developers Packages -->
[godot]: https://godotengine.org
<!-- Text Editors -->
[helix]: ../home/packages/dev/editors/helix
[kaivim]: https://github.com/kaizen-dw/kaivim
[nixvim]: https://github.com/nix-community/nixvim
[vscodium]: ../home/packages/dev/editors/vscodium
<!-- Terminals -->
[wezterm]: ../home/packages/desktop/terminals/wezterm.nix
[foot]: ../home/packages/desktop/terminals/foot.nix

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
