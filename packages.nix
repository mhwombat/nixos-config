{ config, pkgs, options, inputs, ... }:

with pkgs;
{

###  nixpkgs.config.permittedInsecurePackages = [
###    "python3.10-kerberos-1.3.1"
###  ];

#  nixpkgs.overlays = [
#    (import ./overlays/default.nix)
#  ];

  # Packages I want to use
  environment.systemPackages = [
    #
    # My custom packages
    #
    # pkgs.amy-jot
    # pkgs.amy-textadept
    # inputs.hello-flake.packages."${pkgs.stdenv.hostPlatform.system}".default
    inputs.wombat-themer.packages."${pkgs.stdenv.hostPlatform.system}".default
    #
    # Standard packages
    #
    # alacritty # X and wayland
    aspell
    aspellDicts.en
    aspellDicts.en-computers
#    aspellDicts.en-science
#    autotiling  # used by my sway config
    bashmount # disk mounter
#    bemenu # used by my sway config
    brave
    # busybox DON'T USE! Overwrites realpath!
    chromium # X-only? See ozone?
    direnv
    # dolphin
    firefox # X and wayland
    foot
    fuzzel
    ghc # required for haskell-language-server
    git-crypt
    gitFull
    git-lfs
    gimp # X and wayland
    # globalprotect-openconnect # provides gpclient
    gnumake
    haskellPackages.haskell-language-server
#    haskellPackages.hls-stylish-haskell-plugin # for language server BROKEN on 2024-08-02
    hyprpicker # color picker, wayland
    imagemagick
    imv
    inkscape # X and wayland
    kdePackages.okular
    libreoffice # X and wayland
#    litemdview # BROKEN on 2025-01-10
    meld # X and wayland
    nix-direnv
    nix-index # provides nix-locate
#    noson # sonos alternative
    notmuch
    # onedrive
    pandoc
    # pdfslicer
    # for podman, see containers.nix
    # python
    # qtile # X and wayland
    recoll
    remind
    signal-desktop # X-only
    starship
    # sway enabled in wayland.nix
    textadept
    texlive.combined.scheme-full
    thunar
    tree
    tumbler # used by thunar for thumbnails
    unzip
    # via
    # vial
    vlc
    waybar # wayland only # used by my niri config
    wdiff
    # wev # X and wayland, installed with sway by default
    wl-clipboard
    xwayland
    zip
#    zoneminder
  ];
}
