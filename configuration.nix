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

  # Install firefox.
  programs.firefox.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable the OpenSSH server.
  services.sshd.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

}
