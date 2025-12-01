{ config, pkgs, ... }:
{
  imports =
    [
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

  # Allow auto-mounting of USB storage devices
  services.udisks2.enable = true;

  # allow users to manage removable media
  # services.udiskie.enable = true;

  fonts.packages = with pkgs; [
    font-awesome # used by waybar
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.amy = {
    isNormalUser = true;
    home = "/home/amy";
    description = "Amy de Buitléir";
    extraGroups = [ "wheel" "networkmanager" "vboxsf" "docker" "audio" "dialout" "input" ];
    uid = 1000;
    shell = pkgs.bashInteractive;
  };

}
