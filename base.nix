{ config, pkgs, hostname, ... }:

{
  # Allow software with an unfree license
  # nixpkgs.config.allowUnfree = true;

  # Allow broken packages
  # nixpkgs.config.allowBroken = true;

  # Enable Nix flakes
  nix.extraOptions = "experimental-features = nix-command flakes";

  # These variables end up in /etc/set-environment.
  # They may not take effect until you log out and back in again.
  environment.variables = import ./environment-variables.nix;

  networking.hostName = "${hostname}";

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
