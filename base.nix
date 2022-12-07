{ config, pkgs, ... }:

{
  # Allow software with an unfree license
  nixpkgs.config.allowUnfree = true;

  # Allow broken packages
  # nixpkgs.config.allowBroken = true;

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

  # # enable wshowkeys
  # programs.wshowkeys.enable = true;

  # programs.zsh.enable = true;

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
    # shell = pkgs.zsh;
    shell = pkgs.bashInteractive;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable a periodically executed systemd service named nixos-upgrade.service.
  # If the allowReboot option is false, it runs nixos-rebuild switch --upgrade.
  # If allowReboot is true, then the system will automatically reboot if the new generation contains a different kernel, initrd or kernel modules.
  # To see when the service runs, see systemctl list-timers.
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = false;
  system.autoUpgrade.channel = https://nixos.org/channels/nixos-unstable;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

}
