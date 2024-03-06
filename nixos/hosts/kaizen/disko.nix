{
  enableConfig = false;
  devices.disk = {
    main = {
      type = "disk";
      device = "/dev/nvme0n1";
      content = {
        type = "gpt";
        partitions = {
          esp = {
            size = "100M";
            type = "EF00";
            content = {
              format = "vfat";
              type = "filesystem";
              mountpoint = "/boot";
            };
          };
          root = {
            size = "100%";
            content = {
              format = "ext4";
              mountpoint = "/";
              type = "filesystem";
            };
          };
        };
      };
    };
  };
}
