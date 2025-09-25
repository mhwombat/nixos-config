{ config, pkgs, ... }:

let
  hostname="sage";
in
{
  imports =
    [ # Include the results of the hardware scan.
      (./. + "/${hostname}-hardware-configuration.nix")
      (./. + "/${hostname}.nix")
      ./base.nix
      ./sound.nix
      ./printers.nix
#      ./email.nix
       ./locale.nix
#      ./wayland.nix
     ./packages.nix
      #
      # Scheduled services
      #
#      ./scheduling/sync-email.nix
#      ./scheduling/email-reminders.nix
#      ./scheduling/recollindex.nix
    ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.amy = {
    isNormalUser = true;
    description = "Amy de Buitléir";
    home = "/home/amy";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable the OpenSSH server.
  services.sshd.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
