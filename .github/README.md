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
    <a href='https://github.com/kaizen-dw/Flakes/'>
      <img src='https://img.shields.io/github/repo-size/kaizen-dw/Flakes?color=C6A0F6&labelColor=303446&style=for-the-badge&logo=github&logoColor=C6A0F6'>
    </a>
    <img src='https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png' width='600px' />
  </div>

  **[<kbd> <br> Overview <br> </kbd>](#-Overview)** 
  **[<kbd> <br> Installation <br> </kbd>](#-Installation)** 
  **[<kbd> <br> &nbsp;Keybindings&nbsp; <br> </kbd>](#-Keybindings)** 
  **[<kbd> <br> Acknowledgements&nbsp; <br> </kbd>](#-Acknowledgements)**

</h1><br />

# 🗃️ Overview

### 📦 Packages

<details>
<summary>🖥️ <b>Core packages</b></summary><br />

- Shell: [bash][bash]
- Text Editor: [nixvim][nixvim]
- Syntax Highlighting: [bat][bat]
- System Resource Monitor: [btop][btop]
- Sound Server: [pipewire][pipewire]
- Containerization Tool: [podman][podman]

</details>

<details>
<summary>🎯 <b>Home Packages</b></summary><br />

- **Terminal:** [foot][foot] & [kitty][kitty]
- **Text Editor:** [helix][helix] & [lunarvim][lunarvim] & [vscodium][vscodium]
- **Display/Desktop Packages:**
  - Window Manager: [hyprland][hyprland]
  - Widgets: [Aylurs Gtk Shell][ags]
  - Wallpaper: [swww][Swww]
  - Browser: [firefox][firefox]
- **CLI Packages**
  - File Manager: [yazi][yazi]
  - Terminal Multiplexer: [zellij][zellij]
  - System Information Tool: [neofetch][neofetch]
- **Media Packages**
  - Media Player: [mpv][mpv]
  - Image Viewer: [swayimg][swayimg]
  - Audio Control: [pavucontrol][pavucontrol]
- **Other Packages**
  - Game Engine: [godot][godot]
  - Raster Graphics: [krita][krita]
  - 3D Graphics: [blender][blender]
  - Pixel Art Tool: [aseprite][aseprite]
  - Document Viewer: [zathura][zathura]

</details>

<details>
<summary>🎨 <b>Themes</b></summary>

- Color Scheme: [Catppuccin][Catppuccin]
- Cursor: [Bibata Modern Ice][Bibata-Cursor]
- Icons: [Papirus Dark][Papirus-icon-theme]

</details>

### 📚 Structure
- `flake.nix`: Entrypoint
- `home`: Home-manager configurations
    - `packages`: folder arranged package configurations.
    - `profiles`: Home-manager profiles
- `nixos`: NixOS configurations.
    - `core`: Core configuration
    - `hosts`: Host module configurations
        - `thinkpad`: Lenovo Thinkpad T495 - 16GB RAM, Ryzen 5 3500U
- `pkgs`: exported packages (currently empty)

<p align="right"><a href="#top">back to top</a></p>

# 🚀 Installation
### Initial Steps
- Download [NixOS minimal installation](https://nixos.org/download) ISO.
- Boot into the installer.
- Switch to root: `sudo -i`

### 1. Partition
- EFI partition depends how much `generations` you'll be needing. I only use 100MB because I typically don't need more than 3 generations.

- My partition table:

| Label |   Directory    | Size  |
| ----- | -------------- | ----- |
| Boot  | /dev/nvme0n1p1 | 100MB |
| Swap  | /dev/nvme0n1p2 |  8GB  |
| Root  | /dev/nvme0n1p3 | Rest  |

- **Format created partitions**
    - Boot
    ```
    mkfs.fat -F 32 -n boot /dev/nvme0n1p1
    ```
    - Swap
    ```
    mkswap -L /dev/nvme0n1p2
    ```
    - Root
    ```
    mkfs.ext4 -L nixos /dev/nvme0n1p3
    ```

### 2. Install my configuration
- **Quick installation**
  ```
    chmod +x ./install.sh && ./install.sh
  ```

- **Manual Installation**
  - Generate NixOS config

  ```
    nixos-generate-config --root /mnt
  ```

  - Clone this repository

  ```
    nix-env -iA nixos.git 
    git clone https://github.com/kaizen-dw/Flakes && cd Flakes
  ```

  - Add Submodules (Ags widgets)

  ```
    git submodule init && git submodule update
  ```

  - Optional: Make your own host at `Flakes/nixos/hosts`
  - Copy and replace hardware configuration, replace `<hostname>`, or just use 'basic'

  ```
    cp /mnt/etc/nixos/hardware-configuration.nix nixos/<hostname>/hardware-configuration.nix
  ```

  - Build by hostname, use the hostname you put your hardware configuration. 

  ```
    nixos-rebuild switch --flake .#<hostname>
  ```

<p align="right"><a href="#top">back to top</a></p>

# 💐 Acknowledgements

- [Ruixi-rebirth/melted-flakes](Ruixi)
- [Misterio77/nix-config](Misterio77)
- [aylur/dotfiles](Aylur)

<!-- Links -->
[Hyprland]: ../home/packages/desktop/hyprland/default.nix 
[Ags]: ../home/packages/desktop/ags/default.nix
[Swww]: https://github.com/LGFae/swww

[zellij]: ../home/packages/cli/zellij
[tmux]: ../nixos/hosts/thinkpad/default.nix
[neofetch]: https://github.com/dylanaraps/neofetch

[bash]: ../nixos/core/programs.nix
[bat]: ../home/packages/cli/bat.nix
[pipewire]: ../nixos/core/services.nix
[podman]: ../nixos/core/virtualisation.nix

[foot]: ../home/packages/terminal/foot.nix
[kitty]: ../home/packages/terminal/kitty/default.nix

[nixvim]: ../nixos/nixvim
[firefox]: ../home/packages/desktop/browsers/firefox.nix 
[lunarVim]: ../home/packages/dev/editors/lunarvim.nix
[neovim]: https://github.com/kaizen-dw/neovim-config
[helix]: ../home/packages/dev/editors/helix/default.nix
[vscodium]: ../home/packages/dev/editors/vscodium/default.nix

[Bibata-Cursor]: https://github.com/ful1e5/Bibata_Cursor
[Catppuccin]: https://github.com/catppuccin/catppuccin
[Papirus-icon-theme]: https://github.com/PapirusDevelopmentTeam/papirus-icon-theme

[yazi]: https://github.com/sxyazi/yazi

[pavucontrol]: https://github.com/pulseaudio/pavucontrol
[aseprite]: https://www.aseprite.org/
[krita]: https://krita.org/en/
[blender]: https://www.blender.org/
[godot]: https://godotengine.org/

[btop]: ../home/packages/cli/btop.nix
[mpv]: ../home/packages/media/default.nix 
[Starship]: ../home/packages/shell/starship.nix
[zathura]: ../home/packages/desktop/apps/office/zathura.nix
[sioyek]: ../home/packages/desktop/apps/office/sioyek.nix
[swayimg]: https://github.com/artemsen/swayimg

<!-- Acknowledgements -->
[Ruixi]: https://github.com/Ruixi-rebirth/flakes
[Misterio77]: https://github.com/Misterio77/nix-config
[Aylur]: https://github.com/aylur/dotfiles
