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
  </div><br />

---


**[<kbd> <br> Overview <br> </kbd>](#-Overview)** 
**[<kbd> <br> Installation <br> </kbd>](#-Installation)** 
**[<kbd> <br> Configure <br> </kbd>](#-Overview)** 
**[<kbd> <br> Acknowledgements&nbsp; <br> </kbd>](#-Acknowledgements)**


---

</div>


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
- Browser: [Firefox][Firefox] & [Nyxt][Nyxt]
- Editor: [LunarVim][LunarVim] & [VSCodium][VSCodium]

</details>

<details open>
<summary>🎨 <b>Theme</b></summary>

- Color Scheme: [Catppuccin][Catppuccin]
- Cursor: [Bibata Modern Ice][Bibata-Cursor]
- Icons: [Papirus Dark][Papirus-icon-theme]

</details>

<details open>
<summary>💬 <b>Fonts</b></summary>

- Sans Serif: [Ubuntu Nerd Font][Ubuntu-Nerd-Font]
- Monospace: [JetBrains Mono Nerd Font][JetBrains-Mono-Nerd-Font]
- Emoji: [Noto Color Emoji][Noto-Color-Emoji]
</details>

<details>
 <summary>🍎 <b>Other Applications</b></summary>

- File Explorer: [yazi][yazi]
- Digital Painting: [Krita][Krita]
- 3D Modeling tool: [Blender][Blender]
- Screen Recording: [wf-recorder][wf-recorder]
</details>

---

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

# 🙏 Acknowledgements

- [Misterio77/nix-config](Misterio77)
- [Ruixi-rebirth/melted-flakes](Ruixi)
- [aylur/dotfiles](Aylur)
- [justinlime/dotfiles](justinlime)

<!-- Links -->
[Hyprland]: https://github.com/hyprwm/Hyprland
[Ags]: https://github.com/aylur/ags
[Swww]: https://github.com/LGFae/swww

[Foot]: https://codeberg.org/dnkl/foot
[Kitty]: https://github.com/kovidgoyal/kitty

[Nyxt]: https://github.com/atlas-engineer/nyxt
[Firefox]: https://www.mozilla.org/en-US/firefox/browsers
[LunarVim]: https://github.com/LunarVim/LunarVim
[VSCodium]:https://vscodium.com/

[Bibata-Cursor]: https://github.com/ful1e5/Bibata_Cursor
[Catppuccin]: https://github.com/catppuccin/catppuccin
[Papirus-icon-theme]: https://github.com/PapirusDevelopmentTeam/papirus-icon-theme

[yazi]: https://github.com/sxyazi/yazi
[Krita]: https://krita.org/en/
[Blender]: https://www.blender.org/

[Starship]: https://github.com/starship/starship
[Btop]: https://github.com/aristocratos/btop
[Swaylock-effects]: https://github.com/mortie/swaylock-effects
[mpv]: https://github.com/mpv-player/mpv
[Neovim]: https://github.com/neovim/neovim
[grimblast]: https://github.com/hyprwm/contrib
[wl-clipboard]: https://github.com/bugaevc/wl-clipboard
[wf-recorder]: https://github.com/ammen99/wf-recorder
[hyprpicker]: https://github.com/hyprwm/hyprpicker
[Catppuccin]: https://github.com/catppuccin/catppuccin


<!-- Acknowledgements -->
[Aylur]: https://github.com/aylur/dotfiles
[Misterio77]: https://github.com/Misterio77/nix-config
[Ruixi]: https://github.com/Ruixi-rebirth/melted-flakes
[justinlime]: https://github.com/justinlime/dotfiles
