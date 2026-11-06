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
      # ./web-server.nix
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

  # BIOS updates
  services.fwupd.enable = true;

  fonts.packages = with pkgs; [
    font-awesome # used by waybar
  ];

  xdg.mime.defaultApplications = {
    "application/pdf" = "okularApplication_pdf.desktop";
    "application/x-extension-htm" = "librewolf.desktop";
    "application/x-extension-html" = "librewolf.desktop";
    "application/x-extension-shtml" = "librewolf.desktop";
    "application/x-extension-xht" = "librewolf.desktop";
    "application/x-extension-xhtml" = "librewolf.desktop";
    "application/xhtml+xml" = "librewolf.desktop";
    "application/x-zerosize" = "librewolf.desktop";
    "text/html" = "librewolf.desktop";
    "x-scheme-handler/chrome" = "librewolf.desktop";
    "x-scheme-handler/http" = "librewolf.desktop";
    "x-scheme-handler/https" = "librewolf.desktop";
    "x-scheme-handler/sgnl" = "signal.desktop";
    "x-scheme-handler/signalcaptcha" = "signal.desktop";
  };

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
