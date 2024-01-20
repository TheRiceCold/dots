###### *<div align = right><sub>// developed by dale walter</sub></div>*

<h1 align="center">  
 <img src="https://files.catbox.moe/i4twd5.png" width="115px" />

 Kaizen's Flakes<br />
 <div align="center">
    <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png" width="600px" /> <br />
    <a href="https://nixos.org">
      <img src="https://img.shields.io/badge/NixOS-unstable-blue.svg?style=for-the-badge&labelColor=303446&logo=NixOS&logoColor=white&color=91D7E3">
    </a>
    <a href="https://github.com/kaizen-dw/Flakes/stargazers">
      <img src="https://img.shields.io/github/stars/kaizen-dw/FLakes?color=F5BDE6&labelColor=303446&style=for-the-badge&logo=starship&logoColor=F5BDE6">
    </a>
    <a href="https://github.com/kaizen-dw/Flakes/">
      <img src="https://img.shields.io/github/repo-size/kaizen-dw/Flakes?color=C6A0F6&labelColor=303446&style=for-the-badge&logo=github&logoColor=C6A0F6">
    </a>
  </div>
</h1>
<h1 align="center">

  **[<kbd> <br> Overview <br> </kbd>](#-Overview)** 
  **[<kbd> <br> Installation <br> </kbd>](#-Installation)** 
  **[<kbd> <br> &nbsp;Structure&nbsp; <br> </kbd>](#-Structure)** 
  **[<kbd> <br> Acknowledgements&nbsp; <br> </kbd>](#-Acknowledgements)**

</h1>


# 🗃️ Overview

### 👨‍💻 Software

<details open>
<summary>🖥️ <b>Display</b></summary>
 
- Window Manager: [Hyprland][Hyprland]
- Wallpaper: [Swww][Swww]
- Widgets: [Ags][Ags]
</details>

<details open>
<summary>🎯 <b>Core Applications</b></summary>

- Terminal: [Foot][Foot] & [Kitty][Kitty]
- Browser: [Firefox][Firefox]
- System Resource Monitor: [Btop][Btop]
- File Manager: [yazi][yazi]
- Image Viewer: [swayimg][swayimg]
- Editor: [LunarVim][LunarVim] & [VSCodium][VSCodium]
- Document Viewer: [zathura][zathura] || [sioyek][sioyek]
- Media Player: [mpv][mpv]


</details>

<details open>
<summary>🎨 <b>Theme</b></summary>

- Color Scheme: [Catppuccin][Catppuccin]
- Cursor: [Bibata Modern Ice][Bibata-Cursor]
- Icons: [Papirus Dark][Papirus-icon-theme]

</details>

<details>
<summary>📝 Shell aliases</summary>

- `c`: `clear`
- `v`: `lvim`
- `nix-rollback`:  `doas nixos-rebuild switch --rollback`

</details>

<details>
<summary>🔧 Shell functions</summary>

- `nix-clean`
    ```
        nix-clean() {
          doas nix-collect-garbage -d
        }
    ```
- `nix-switch '<hostname>'`
    ```
        nix-switch() {
          cd ~/Flakes && git add . && doas nixos-rebuild switch --flake .#$1
        }
    ```
- `nix-rollback`
    ```
        nix-clean-switch() {
          nix-clean && nix-switch $1
        }
    ```

</details>

<p align="right"><a href="#top">back to top</a></p>

# 📚 Structure
- `flake.nix`: Entrypoint for NixOS configurations.
- `home`: Home-manager configurations
    - `packages`: Mostly packages/apps configuration modules.
    - `profiles`: Home-manager profiles
- `nixos`: NixOS configurations for hosts and home-manager.
    - `core`: Core NixOS configuration
    - `hosts`: NixOS configurations
        - `thinkpad`: Lenovo Thinkpad T495 - 16GB RAM, Ryzen 5 3500U
- `pkgs`: exported packages (currently empty)

<p align="right"><a href="#top">back to top</a></p>

# 🚀 Installation
You will need to download [NixOS minimal installation](https://nixos.org/download) ISO and create a bootable disk/usb.

### 1. Partition
You can use `cfdisk` for create 3 partition if your on UEFI boot:

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

### 2. Install
  ```
    nix-env -iA nixos.git 
    git clone https://github.com/kaizen-dw/Flakes
    chmod +x ~/Flakes/scripts/install.sh && ~/Flakes/scripts/install.sh
  ```

### 3. Add widgets(ags configuration)
    git submodule init && git submodule update

<p align="right"><a href="#top">back to top</a></p>

# 🙏 Acknowledgements

- [Misterio77/nix-config](Misterio77)
- [Ruixi-rebirth/melted-flakes](Ruixi)
- [aylur/dotfiles](Aylur)
- [justinlime/dotfiles](justinlime)

<!-- Links -->
[Hyprland]: ../home/packages/desktop/hyprland/default.nix 
[Ags]: ../home/packages/desktop/ags/default.nix
[Swww]: https://github.com/LGFae/swww

[Foot]: ../home/packages/terminal/foot.nix
[Kitty]: ../home/packages/terminal/kitty/default.nix

[Firefox]: ../home/packages/browser/firefox.nix 
[LunarVim]: ../home/packages/editor/lunarvim.nix
[VSCodium]: ../home/packages/editor/vscodium/default.nix

[Bibata-Cursor]: https://github.com/ful1e5/Bibata_Cursor
[Catppuccin]: https://github.com/catppuccin/catppuccin
[Papirus-icon-theme]: https://github.com/PapirusDevelopmentTeam/papirus-icon-theme

[yazi]: https://github.com/sxyazi/yazi
[Krita]: https://krita.org/en/
[Blender]: https://www.blender.org/

[btop]: ../home/packages/cli/btop.nix
[mpv]: ../home/packages/media/mpv.nix 
[Starship]: ../home/packages/shell/starship.nix
[zathura]: ../home/packages/tools/zathura.nix
[sioyek]: ../home/packages/tools/sioyek.nix
[swayimg]: https://github.com/artemsen/swayimg


<!-- Acknowledgements -->
[Aylur]: https://github.com/aylur/dotfiles
[Misterio77]: https://github.com/Misterio77/nix-config
[Ruixi]: https://github.com/Ruixi-rebirth/melted-flakes
[justinlime]: https://github.com/justinlime/dotfiles
