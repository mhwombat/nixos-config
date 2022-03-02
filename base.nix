{ config, pkgs, ... }:

{
  # Allow software with an unfree license
  nixpkgs.config.allowUnfree = true;

  # Set the JAVA_HOME environment variable
  programs.java.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;


  # Enable the OpenSSH server.
  services.sshd.enable = true;

  # Enable Nix flakes
  nix.package = pkgs.nixUnstable;
  nix.extraOptions = "experimental-features = nix-command flakes";

  programs.zsh.enable = true;

  # These variables end up in /etc/set-environment.
  # They may not take effect until you log out and back in again.
  environment.variables = import ./environment-variables.nix;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.amy = {
    isNormalUser = true;
    home = "/home/amy";
    description = "Amy de Buitleir";
    extraGroups = [ "wheel" "networkmanager" "vboxsf" "docker" "audio" ];
    uid = 1000;
    shell = pkgs.zsh;
#    shell = pkgs.bashInteractive;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

}
