{ config, pkgs, ... }:

{
  # Allow software with an unfree license
  # nixpkgs.config.allowUnfree = true;

  # Allow broken packages
  # nixpkgs.config.allowBroken = true;

  # Enable Nix flakes
#  nix.package = pkgs.nixUnstable;
  nix.extraOptions = "experimental-features = nix-command flakes";

  # These variables end up in /etc/set-environment.
  # They may not take effect until you log out and back in again.
  environment.variables = import ./environment-variables.nix;

}
