<h1 align="center">
  <img src="https://files.catbox.moe/i4twd5.png"></img> 
  <br />
  My Flakes
</h1>
<p align="center">:snowflake: Wolly's NixOS configuration Flake :snowflake:</p>

# Screenshots

# Installation Guide
You will need to download [NixOS minimal installation](https://nixos.org/download#:~:text=without%20a%20desktop.-,Minimal%20ISO%20image,-The%20minimal%20installation) ISO and create a bootable disk/usb.
<details>
  <summary>Contents</summary>
  <ul>
    <li>
      <a href="#"> 
        1. Partition 
      </a>
    </li>
    <li>
      <a href="#"> 
        2. Mounting 
      </a>
    </li>
    <li>
      <a href="#"> 
        3. Installation
      </a>
    </li>
  </ul>
</details>

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

## 2. Mounting

- Mount Home directory
```
mount /dev/disk/by-label/nixos /mnt
```
- Make & Mount Boot directory
```
mkdir -p /mnt/boot && mount /dev/disk/by-label/boot /mnt/boot
```

### 3. Installation
- Choose a script file to install in scripts dir: `install-laptop.sh`, `install-minimal.sh`, `install-vm.sh`
```
chmod +x ~/Flakes/scripts/<script-file> && ~/Flakes/scripts/<script-file>
```
- Reboot your computer
```
reboot
```
- (Optional) Run `setup.sh` for additional apps
```
chmod +x ~/Flakes/scripts/setup.sh && ~/Flakes/scripts/setup.sh
```
