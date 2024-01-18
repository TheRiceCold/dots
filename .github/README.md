###### *<div align = right><sub>// developed by dale walter</sub></div>*

<h1 align="center">  
 <img src="https://files.catbox.moe/i4twd5.png" width="115px" />

   Kaizen's Flakes<br />
</h1>
<div align="center">
 <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png" width="600px" />
 <br /><br />
  <div align="center">
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
</div><br />

&nbsp;[<kbd> <br> Overview&nbsp;<br> </kbd>](#-Overview)&nbsp;&nbsp;
&nbsp;[<kbd> <br> Installation <br> </kbd>](#-Installation)&nbsp;&nbsp;
<br><br><br>

# 🗃️ Overview

### 👨‍💻 Software

<details open>
<summary>🖥️ <b>Display</b></summary>
 
- Window Manager: [Hyprland](https://hyprland.org)
- Wallpaper: [swww](https://github.com/GhostNaN/mpvpaper)
- Widgets: [ags](https://github.com/aylur/ags)
</details>

<details open>
<summary>🎯 <b>Core Applications</b></summary>

- Editor: [LunarVim](https://neovim.io/) & [VSCodium]()
- Browser: [Firefox](https://www.mozilla.org/en-US/firefox/developer/) & [Nyxt]()
- Terminal: [Foot]() & [Kitty](https://sw.kovidgoyal.net/kitty)

</details>

<details open>
<summary>🎨 <b>Theme</b></summary>

- Color Scheme: [catppuccin](https://github.com/nosvagor/vagari#palette)
- Cursors: [Bibata Modern Ice](https://github.com/alvatip/Nordzy-cursors)
- Icons: [Papirus Dark](https://github.com/alvatip/Nordzy-icon) (temporary)

</details>

<details open>
<summary>💬 <b>Fonts</b></summary>

- Sans Serif: [Ubuntu Nerd Font](https://fonts.google.com/specimen/Albert+Sans?query=Albert+Sans)
- Monospace: [JetBrains Mono Nerd Font](https://github.com/tonsky/FiraCode)
- Emoji: [Noto Color Emoji](https://fonts.google.com/noto/specimen/Noto+Color+Emoji)
</details>

<details>
 <summary>🍎 <b>Other Applications</b></summary>

- File Explorer: [joshuto](https://github.com/sayanarijit/xplr)
- Image Editing: [krita](https://www.gimp.org/)
- Screen Recording: [wf-recorder](https://github.com/ammen99/wf-recorder)
- Audio Editing: [audacity](https://www.audacityteam.org/)
- Video Editing: [blender](https://www.blender.org/features/video-editing/)
</details>
<hr />

### 📚 Structure
- `flake.nix`: Entrypoint for NixOS configurations.
- `nixos`: NixOS configurations for hosts and home-manager.
    - `hosts`: NixOS configurations
        - `thinkpad`: Lenovo Thinkpad T495 - 16GB RAM, Ryzen 5 3500U
    - `home`: Home-manager configurations
    - `sys`: 
- `assets`: Contains images, videos, etc. Anything that isn't code related.
- `overlay`:
- `templates`: 

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

<!-- Acknowledgements -->
[Aylur]: https://github.com/aylur/dotfiles
[misterio77]: https://github.com/misterio77/nix-config
[Ruixi]: https://github.com/Ruixi-rebirth/melted-flakes
