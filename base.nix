{ config, pkgs, ... }:

{
  # Allow software with an unfree license
  # nixpkgs.config.allowUnfree = true;

  # Allow broken packages
  # nixpkgs.config.allowBroken = true;

  # Enable Nix flakes
  nix.package = pkgs.nixUnstable;
  nix.extraOptions = "experimental-features = nix-command flakes";

  # Support for configurable keyboard
  services.udev.packages = with pkgs; [ vial via ];

  # These variables end up in /etc/set-environment.
  # They may not take effect until you log out and back in again.
  environment.variables = import ./environment-variables.nix;

  # Enable the OpenSSH daemon.
  # services.sshd.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.amy = {
    isNormalUser = true;
    home = "/home/amy";
    description = "Amy de Buitléir";
    extraGroups = [ "wheel" "networkmanager" "vboxsf" "docker" "audio" "dialout" ];
    uid = 1000;
    shell = pkgs.bashInteractive;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
