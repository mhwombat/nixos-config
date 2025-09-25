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
}
