{ config, pkgs, hostname, ... }:

{

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

  # Enable the OpenSSH daemon.
  # services.sshd.enable = true;

#  # Automatic upgrades
#  system.autoUpgrade = {
#    enable = true;
#    allowReboot = false; # Do nixos-rebuild switch --upgrade instead
#  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
