<h1 align="center">
  <img src="https://files.catbox.moe/i4twd5.png"></img> 
  <br />
  My Flakes
</h1>
<p align="center">:snowflake: Wolly's NixOS configuration Flake :snowflake:</p>

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
        2. Mouting 
      </a>
    </li>
    <li>
      <a href="#"> 
        3. Generate Basic Config
      </a>
    </li>
    <li>
      <a href="#">
        4. Clone Repository
      </a>
    </li>
    <li>
      <a href="#">
        5. Finish Install
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
| Home  | /dev/nvme0n1p3 | Rest  |

- Format created partitions
    - Boot
    ```
    mkfs.fat -F 32 -n boot /dev/nvme0n1p1
    ```
    - Swap
    ```
    mkswap -L /dev/nvme0n1p2
    ```
    - Home
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

### 3. Generate Basic Configuration
```
nixos-generate-config --root /mnt
```

### 4. Clone Repository
- Install git (virtually)
```
nix-shell -p git
```
- Clone this repo. 
```
git clone https://github.com/kaizen-dw/Flakes
```
- Copy/Overwrite `hardware-configuration.nix`
```
cp /mnt/etc/nixos/hardware-configuration.nix ~/Flakes/hosts/hardware-configuration.nix
```

### 5. Finish Installation
- Go to Flakes directory and install
```
cd Flakes && nixos-install --flake .#wolly
```
- Reboot your computer
```
reboot
```
- Login username and password. Change them at `~/Flakes/hosts/system.nix` line 22 to 24
```
username: wolly
password: password
```
