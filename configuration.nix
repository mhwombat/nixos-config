{ config, pkgs, ... }:

let hostname="wombat11k";
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      (./. + "/${hostname}.nix")
      ./base.nix
      ./locale.nix
      ./xserver.nix
      ./wayland.nix
      ./python3.nix
      ./containers.nix
      ./packages.nix
    ];
}

