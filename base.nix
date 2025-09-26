{ config, pkgs, hostname, ... }:

{
  imports =
    [
      (./. + "/${hostname}-hardware-configuration.nix")
      (./. + "/${hostname}.nix")
      ./sound.nix
      ./printers.nix
      ./email.nix
      ./locale.nix
      ./wayland.nix
      ./environment.nix
      ./packages.nix
    ];

  # Allow software with an unfree license
  # nixpkgs.config.allowUnfree = true;

  # Allow broken packages
  # nixpkgs.config.allowBroken = true;

  # Enable Nix flakes
  nix.extraOptions = "experimental-features = nix-command flakes";

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

#   programs.git.config =
#     {
#       user = {
#               email = amy@nualeargais.ie
#               name = Amy de Buitléir
#             };
#       push = {
#               default = simple
#       };
#       filter "lfs"]
#               clean = git-lfs clean -- %f
#               smudge = git-lfs smudge -- %f
#               process = git-lfs filter-process
#               required = true
#       };
#       init = {
#               defaultBranch = "main";
#       };
#       pull = {
#               rebase = true;
#       };
#       core = {
#               excludesFile = /home/amy/.config/git/gitignore
#       };
#     }

# TODO replicate this functionality
# .bashrc
# .bash_profile
# .cabal/config
# .config/shell-agnostic
# .config/foot/foot.ini
# .config/foot/colours.ini
# .config/git/config
# .config/git/gitignore
# .config/offlineimap/config
# .config/recoll/recoll.conf
# .config/recoll/mimemap
# .config/remind
# .config/starship
# .config/textadept/init.lua
# .config/textadept/themes/base16-amy.lua
# .config/sway
# .config/waybar/config
# .config/waybar/style.css
# .ghci
