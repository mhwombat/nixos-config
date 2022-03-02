{ config, pkgs, ... }:

{
  # Use the GRUB 2 boot loader.
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  # Enable VMware tools.
  virtualisation.vmware.guest.enable = true;

  # Share our host filesystem
  fileSystems."/OneDriveVMware" = {
    fsType = "fuse./run/current-system/sw/bin/vmhgfs-fuse";
    device = ".host:/OneDriveVMware";
    options = [
      "umask=22"
      "uid=1000"
      "gid=1000"
      "allow_other"
      "auto_unmount"
      "defaults"
    ];
  };
  fileSystems."/shared-drive" = {
    fsType = "fuse./run/current-system/sw/bin/vmhgfs-fuse";
    device = ".host:/shared-drive";
    options = [
      "umask=22"
      "uid=1000"
      "gid=1000"
      "allow_other"
      "auto_unmount"
      "defaults"
    ];
  };

}
