{ config, pkgs, ... }:

{
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "wombat11k";

    interfaces = {
      enp67s0.useDHCP = true;
      enp68s0.useDHCP = true;
      wlo2.useDHCP = true;
    };

    wireless = {
      enable = true;  # Enables wireless support via wpa_supplicant.
      interfaces = [ "wlo2" ];
      # networks = {
      #   "FRITZ!Box 7530 NU" = {
      #     pskRaw = "<redacted, importing SECRETS.nix instead>";
      #   };
      # };
    };
  };

  # Printer
  services.printing.drivers = [ pkgs.hplipWithPlugin ];

  # Scanner
  hardware.sane.netConf = "192.168.178.29";

  # OneDrive
  services.onedrive.enable=true;
}
