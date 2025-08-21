{ config, pkgs, ... }:

{

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.memtest86.enable = true; # add memtest to boot menu

  fileSystems."/home/amy" =
    { device = "/dev/disk/by-label/burrow";
      fsType = "ext4";
    };

  networking = {
    hostName = "wombat11k";

    interfaces = {
      enp67s0.useDHCP = true;
      enp68s0.useDHCP = true;
      wlo2.useDHCP = true;

      # Uncomment TEMPORARILY to diagnose firewall problems
      # firewall.enable = false;
    }; # interfaces

    networkmanager.enable = false; # can't use with networking.wireless

    wireless = {
      enable = true;  # Enables wireless support via wpa_supplicant.
      userControlled.enable = true; # enable use of wpa_cli (or wpa_gui if you install wpa_supplicant_gui)
      interfaces = [ "wlo2" ];
      networks = {
        # pskRaw is generated with the command: wpa_passphrase SSID password
#        "vodafone4806D2".pskRaw = "e7f79c45987c0ca510a19b3600ae34f4df8046db3d7e789f789ea6b2f7aa518c";
        "TeachMeabhair".pskRaw = "016cc86f010caae89e62ebeb79e9ab4fb3f22d932b1a402ef6d6e1604fbee71f";
      };
    };

 }; # networking

#  services.zoneminder = {
#    enable = true;
#    port = 895;
#    cameras = 5;
#  };

#  services.mysql = {
#    enable = true;
#    package = pkgs.mariadb;
#  };

}
