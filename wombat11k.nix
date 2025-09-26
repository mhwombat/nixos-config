{ config, pkgs, hostname, ... }:

{

#   imports =
#     [
#       ./shannagh-wifi.nix
#     ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.memtest86.enable = true; # add memtest to boot menu

  fileSystems."/home/amy" =
    { device = "/dev/disk/by-label/burrow";
      fsType = "ext4";
    };

  # Support for configurable keyboard
  # services.udev.packages = with pkgs; [ vial via ];

  networking = {
    hostName = "${hostname}";

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
    }; # wireless

 }; # networking

  # Enable the OpenSSH daemon.
  # services.sshd.enable = true;

#  services.zoneminder = {
#    enable = true;
#    port = 895;
#    cameras = 5;
#  };

#  services.mysql = {
#    enable = true;
#    package = pkgs.mariadb;
#  };

#  # Automatic upgrades
#  system.autoUpgrade = {
#    enable = true;
#    allowReboot = false; # Do nixos-rebuild switch --upgrade instead
#    channel = "https://channels.nixos.org/nixos-unstable";
#  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
