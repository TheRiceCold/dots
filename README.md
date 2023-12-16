###### *<div align = right><sub>// developed by dale walter</sub></div>*

<div align="center">
  <img src="https://files.catbox.moe/i4twd5.png" />
  <div align="center" style="margin-top=0;">
    <h3>Kaizen Flakes</h3>

  [![built with nix](https://img.shields.io/static/v1?logo=nixos&logoColor=white&label=&message=Built%20with%20Nix&color=41439a)](https://builtwithnix.org)
  </div>
</div>

<p align="center">My Configurations Flakes and Templates</p>

&ensp;[<kbd> <br> Screenshots <br> </kbd>](#Screenshots)&ensp;
&ensp;[<kbd> <br> Structure <br> </kbd>](#Structure)&ensp;
&ensp;[<kbd> <br> Installation <br> </kbd>](#Installation)&ensp;
<br><br><br><br></div>

# Screenshots

# Structure
- `flake.nix`: Entrypoint for NixOS configurations.
- `nixos`: NixOS configurations for hosts and home-manager.
    - `hosts`: NixOS configurations
        - `thinkpad`: Lenovo Thinkpad T495 - 16GB RAM, Ryzen 5 3500U
    - `home`: Home-manager configurations
    - `sys`: 
- `assets`: Contains images, videos, etc. Anything that isn't code related.
- `overlay`:
- `templates`: 

# 🔧 Installation
You will need to download [NixOS minimal installation](https://nixos.org/download) ISO and create a bootable disk/usb.

## 1. Partition
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
<p align="right"><a href="#top">back to top</a></p>

## 2. Install
  ```
    nix-env -iA nixos.git 
    git clone https://github.com/kaizen-dw/Flakes
    chmod +x ~/Flakes/scripts/install.sh && ~/Flakes/scripts/install.sh
  ```
<p align="right"><a href="#top">back to top</a></p>

<!-- Acknowledgements -->
[Scrumplex]: https://codeberg.org/Scrumplex/flake
[misterio77]: https://github.com/misterio77/nix-config
[Ruixi]: https://github.com/Ruixi-rebirth/melted-flakes
[Tai Aoki]: https://www.behance.net/Busker
