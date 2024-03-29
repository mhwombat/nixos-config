{ config, pkgs, ... }:

let hostname="wombat11k";
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      (./. + "/${hostname}.nix")
      ./base.nix
      ./sound.nix
      ./printers.nix
      ./email.nix
      ./locale.nix
      # ./xserver.nix
      ./wayland.nix
      # ./containers.nix
      ./packages.nix
      ./schedule.nix
    ];
}
