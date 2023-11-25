{ config, pkgs, ... }:

{

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.memtest86.enable = true; # add memtest to boot menu

  networking = {
    hostName = "wombat11k";

    interfaces = {
      enp67s0.useDHCP = true;
      enp68s0.useDHCP = true;
      wlo2.useDHCP = true;
    };

    networkmanager.enable = false; # can't use with networking.wireless

    wireless = {
      enable = true;  # Enables wireless support via wpa_supplicant.
      interfaces = [ "wlo2" ];
      networks = {
        "FRITZ!Box 7530 NU".pskRaw = "6d89c405b8cbf2899d7254011f1ac901a1e9287d6566ca48f607fe03a5a71452";
      };
    };
  };

}
