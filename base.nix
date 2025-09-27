{ config, pkgs, hostname, ... }:

{
  imports =
    [
      (./. + "/${hostname}-hardware-configuration.nix")
      (./. + "/${hostname}.nix")
      ./sound.nix
      ./printers.nix
      ./email.nix
      ./locale.nix
      ./wayland.nix
      ./environment.nix
      ./packages.nix
    ];

  # Allow software with an unfree license
  # nixpkgs.config.allowUnfree = true;

  # Allow broken packages
  # nixpkgs.config.allowBroken = true;

  # Enable Nix flakes
  nix.extraOptions = "experimental-features = nix-command flakes";

  networking.hostName = "${hostname}";

  fonts.packages = with pkgs; [
    font-awesome # used by waybar
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.amy = {
    isNormalUser = true;
    home = "/home/amy";
    description = "Amy de Buitléir";
    extraGroups = [ "wheel" "networkmanager" "vboxsf" "docker" "audio" "dialout" ];
    uid = 1000;
    shell = pkgs.bashInteractive;
  };

}
